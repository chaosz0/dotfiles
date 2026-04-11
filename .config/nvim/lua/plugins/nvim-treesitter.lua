local languages = { 'markdown',
                    'markdown_inline',
                    'diff',
                    'make',
                    'bash',
                    'c',
                    'python',
                    'java',
                    'go',
                    'zig',
                    'html',
                    'css',
                    'json',
                    'yaml',
                    'vim',
                    'lua',
}

require'nvim-treesitter'.install(languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function() vim.treesitter.start() end,
})

