local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			".git/",
			"%.svg",
			"node_modules/*",
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
			},
			n = {
				["<C-c>"] = actions.close,

				-- File browser remap
				["-"] = fb_actions.goto_parent_dir,
			},
		},
	},
})

vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
		previewer = false,
		-- layout_config = { height = 30, width = 80 },
	})
end)
vim.keymap.set("n", ";r", function()
	builtin.live_grep({})
end)
vim.keymap.set("n", ";b", function()
	builtin.buffers({
		previewer = false,
		initial_mode = "normal",
	})
end)
vim.keymap.set("n", ";t", function()
	builtin.help_tags()
end)
vim.keymap.set("n", ";d", function()
	builtin.diagnostics()
end)
vim.keymap.set("n", ";;", function()
	builtin.resume()
end)

vim.keymap.set("n", "<leader>gc", builtin.git_commits, {}) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set("n", "<leader>gfc", builtin.git_bcommits, {}) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {}) -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- vim.keymap.set("n", "<leader>gs", builtin.git_status, {}) -- list current changes per file with diff preview ["gs" for git status]

vim.keymap.set("n", ";e", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		-- layout_config = { height = 30, width = 80 },
	})
end)
