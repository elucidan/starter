require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "K",vim.lsp.buf.hover)

map("n", "gd", vim.lsp.buf.definition)

map("n", "ca", vim.lsp.buf.code_action)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
