vim.loader.enable()

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter', { ['branch'] = 'main' })
Plug('nvim-treesitter/nvim-treesitter-context')
--Plug('MeanderingProgrammer/render-markdown.nvim')

vim.call('plug#end')

require('plugins.nvim-treesitter')
require('plugins.nvim-treesitter-context')
--require('plugins.render-markdown')


