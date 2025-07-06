set number
set relativenumber
set wrap
set linebreak
set breakindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set showmatch
colorscheme habamax "desert evening industry murphy slate torte darkblue

syntax enable
filetype plugin indent on

augroup markdown_syntax
  autocmd!
  autocmd BufNewFile,BufFilePre,BufRead *.md,*.markdown set filetype=markdown

  autocmd FileType markdown syntax match mdHeader /^#\{1,6}\s.*/
  autocmd FileType markdown hi mdHeader guifg=#569CD6 ctermfg=75

  autocmd FileType markdown syntax match mdList /^\s*[-*+]\s\+/
  autocmd FileType markdown syntax match mdList /^\s*\d\+\.\s\+/
  autocmd FileType markdown hi mdList guifg=#DCDCAA ctermfg=187

  autocmd FileType markdown syntax match mdBold /\*\*\S.*\S\*\*/
  autocmd FileType markdown syntax match mdItalic /\*\S.*\S\*/
  autocmd FileType markdown hi mdBold gui=bold cterm=bold
  autocmd FileType markdown hi mdItalic gui=italic cterm=italic

  autocmd FileType markdown syntax match mdLink /\[[^\]]\+\]([^)]\+)/
  autocmd FileType markdown hi mdLink guifg=#287BDE ctermfg=32 gui=underline cterm=underline

  autocmd FileType markdown syntax region mdCodeBlock start=/^\s*```.*$/ end=/^\s*```\s*$/
  autocmd FileType markdown hi mdCodeBlock guibg=#2D2D2D ctermbg=236

  autocmd FileType markdown syntax match mdInlineCode /`[^`]\+`/
  autocmd FileType markdown hi mdInlineCode guibg=#2D2D2D ctermbg=236
augroup END

let g:markdown_fenced_languages = [
      \ 'python', 'javascript', 'js=javascript', 
      \ 'java', 'c', 'cpp', 'go', 'rust',
      \ 'html', 'css', 'sql', 'json',
      \ 'bash=sh', 'shell=sh', 'sh'
      \ ]
