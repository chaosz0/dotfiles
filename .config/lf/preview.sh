#!/usr/bin/env bash
# https://github.com/gokcehan/lf/wiki/Previews

set -o pipefail
IFS=$'\n'

FILE_PATH="$1"              # Full path to the file being previewed
PV_WIDTH="$2"               # Width of preview pane in columns
PV_HEIGHT="$3"              # Height of preview pane in lines
PV_X="$4"                   # Horizontal position of preview pane
PV_Y="$5"                   # Vertical position of preview pane
PV_MODE="$6"                # Preview mode: "preview" or "preload"

FILENAME="${FILE_PATH##*/}"                    # Filename without directory path
FILE_EXTENSION="${FILENAME##*.}"               # File extension (e.g., "PDF", "TXT")
FILE_EXTENSION_LOWER="${FILE_EXTENSION,,}"     # File extension in lowercase

# Try multiple commands until one succeeds
try() {
    "$@" 2>/dev/null && return 0
    return 1
}

# Check extension first
case "$FILE_EXTENSION_LOWER" in
    # various text files, supported with syntax highlighting via bat
    bash|c|cc|cfg|cjs|conf|cpp|css|csv|cxx|env|go|h|hh|hpp|html|htm|ini|java|js|json|ksh|kt|\
    log|md|mjs|patch|php|pl|prop|properties|py|rb|rs|rst|service|sh|sql|swift|timer|toml|\
    ts|tsv|txt|xhtml|xml|yaml|yml|zsh)
        try bat --strip-ansi=always --color=always --style=plain --line-range=:30 -- "$FILE_PATH" ||
        cat -v -- "$FILE_PATH"
        exit $?
        ;;

    # Common archive formats 
    #7z|br|bz|bz2|bz3|cbr|cb7|cbt|cbz|gz|lz|lz4|lzma|rar|sz|tar|tbz|tgz|tlz|txz|tzst|xz|zst|zip)
    #    try ouch list -t -- "$FILE_PATH" ||
    #    try atool --list -- "$FILE_PATH" ||
    #    try bsdtar --list --file "$FILE_PATH"
    #    exit $?
    #    ;;

    pdf)
        pdfinfo -- "$FILE_PATH"
        exit $?
        ;;

    # Common audio and video formats
    aac|aifc|aiff|avi|au|flac|flv|m4a|m4v|mka|mks|mkv|mov|mp2|mp3|mp4|mpg|mpeg|oga|ogg|ogm|ogv|opus|wav|webm|wv)
    mediainfo -- "$FILE_PATH"
        exit $?
        ;;
esac

# Fall back to MIME type
MIMETYPE=$(file --mime-type -b "$FILE_PATH")    # MIME type from file command

case "$MIMETYPE" in
    text/*)
        try bat --strip-ansi=always --color=always --style=plain --line-range=:30 -- "$FILE_PATH" ||
        cat -v -- "$FILE_PATH"
        exit $?
        ;;

    video/*|audio/*)
        mediainfo -- "$FILE_PATH"
        exit $?
        ;;

    image/*)
        #SIZE=$(stat -c %s -- "$FILE_PATH" 2>/dev/null)
        SIZE=$(stat -c %s -- "$FILE_PATH")
        if [ -n "$SIZE" ] && [ "$SIZE" -gt 10485760 ]; then
            printf "File too large to preview (>10MB)\n"
            exit 0
        fi
        chafa -f sixel -s "$2x$3" --animate off --polite on -t 1 --bg black "$1"
        exit $?
        ;;

    application/pdf)
        pdfinfo -- "$FILE_PATH"
        exit $?
        ;;

esac


# Fallback: show file info
echo '----- File Type Classification -----'
file --dereference --brief -- "$FILE_PATH"
exit 0
