-- Editor options

vim.opt.number = true -- Print the line number in front of each line
vim.opt.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
vim.opt.termguicolors = true
vim.opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"

vim.opt.background = "dark"
vim.opt.list = true
vim.opt.listchars = { lead = '·', tab = '|·' }


-- Folding options
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:▲]]
vim.opt.foldlevel = 99
vim.o.foldcolumn = '0' -- '0' is not bad
