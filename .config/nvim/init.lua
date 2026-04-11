
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

require('plugins.init')

-- blue, darkblue, delek, desert, elflord, evening, habamax, idustry, koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner
vim.cmd.colorscheme('blue')
--vim.opt.background = 'dark'
vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})
vim.api.nvim_set_hl(0, "NormalNC", {bg = "NONE"})

