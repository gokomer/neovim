vim.g.mapleader = " "
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')



-- Fterm
vim.keymap.set('n', '<C-t>', '<Cmd>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')




vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })



-- Move lines
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==") -- move line down(n)
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv") -- move line down(v)
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv") -- move line up(v)



-- Buffer
vim.keymap.set("n", "<A-Left>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<A-Right>", "<Cmd>BufferNext<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<C-A-Left>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<C-A-Right>", "<Cmd>BufferMoveNext<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true, silent = false })



-- Telescpoe
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fgt', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ft', '<Cmd>Telescope notify<CR>')
vim.keymap.set('n', '<leader>fd', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Todo
vim.keymap.set('n', '<leader>todo', '<Cmd>TodoTelescope<CR>')


-- LSP
-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
    local opts = {buffer = bufnr}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

-- Trouble
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", { noremap = true, silent = false })

-- Aerial
vim.keymap.set("n", "<leader>aer", "<cmd>AerialToggle! left<CR>")


-- IncRename

vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<leader>rnn", function() -- use the word highlighted
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { expr = true })

-- Persistence

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)



