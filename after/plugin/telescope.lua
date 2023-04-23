local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			vertical = { width = 0.5 },
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {}) -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {}) -- find string in current working directory as you type
vim.keymap.set("n", "<leader>pc", builtin.grep_string, {}) -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>pb", builtin.buffers, {}) -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {}) -- list available help tags
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, {}) -- list available help tags

vim.keymap.set("n", "<leader>gc", builtin.git_commits, {}) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set("n", "<leader>gfc", builtin.git_bcommits, {}) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {}) -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- vim.keymap.set("n", "<leader>gs", builtin.git_status, {}) -- list current changes per file with diff preview ["gs" for git status]
