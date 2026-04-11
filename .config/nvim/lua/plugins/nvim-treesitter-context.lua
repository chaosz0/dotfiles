require'treesitter-context'.setup{
    enable = true,
    --max_lines = 3,
    line_numbers = true,
    multiline_threshold = 5,
    trim_scope = 'outer',
    mode = 'topline',
}

