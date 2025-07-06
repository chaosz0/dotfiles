
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.spelllang = 'en_us'
--vim.opt.spell = true
vim.opt.cursorline = true
vim.opt.showmatch = true

local has_treesitter, treesitter = pcall(require, "vim.treesitter")
if has_treesitter then
  vim.cmd([[
    autocmd BufEnter *.md lua vim.treesitter.start()
  ]])
end

vim.cmd('colorscheme habamax')
vim.opt.background = 'dark'

