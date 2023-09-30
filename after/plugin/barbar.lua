local status, _ = pcall(require, "barbar")
if not status then
	return
end

-- Barbar tab management
vim.keymap.set("n", "<c-n>", "<cmd>BufferNext<CR>")
vim.keymap.set("n", "<c-m>", "<cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<c-x>", "<cmd>BufferClose<CR>")
