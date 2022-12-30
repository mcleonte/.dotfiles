--local function setup()
--	local function nvim_tree_smart_toggle()
--		local buftype = vim.api.nvim_buf_get_option(0, "filetype")
--		vim.cmd("NvimTreeRefresh")
--		if buftype ~= "NvimTree" then
--			if buftype == "" then
--				vim.cmd("NvimTreeFocus")
--			else
--				vim.cmd("NvimTreeFindFile")
--			end
--		else
--			vim.cmd("NvimTreeToggle")
--		end
--	end
--
--	vim.keymap.set("n", "<leader>p", nvim_tree_smart_toggle, { desc = "Open tree explorer" })
--end

return function()
	local tree_cb = require("nvim-tree.config").nvim_tree_callback

	local nvimtree_keys = {
		{ key = { "<CR>", "o", "<2-LeftMouse>", "l" }, cb = tree_cb("edit") },
		{ key = { "<BS>", "h" }, cb = tree_cb("close_node") },
	}

	require("nvim-tree").setup({
		update_cwd = true,
		disable_netrw = true,
		hijack_netrw = true,
		update_focused_file = {
			enable = false,
		},
		filters = {
			dotfiles = false,
			custom = { ".git", "__pycache__" },
		},
		view = {
			width = 25,
			adaptive_size = false,
			mappings = { list = nvimtree_keys },
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 250,
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
		renderer = {
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					git = {
						unstaged = "",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "✗",
					},
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						arrow_closed = "",
						arrow_open = "",
					},
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = true,
			debounce_delay = 50,
			severity = {
				min = vim.diagnostic.severity.HINT,
				max = vim.diagnostic.severity.ERROR,
			},
		},
	})
end
