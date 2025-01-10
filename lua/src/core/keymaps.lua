local M = {}

function M.setup()
	-- General keymaps
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

	-- Diagnostic keymaps
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
	vim.keymap.set("n", "<leader>o", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

	-- Terminal mode keymaps
	vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	-- Window navigation
	vim.keymap.set("n", "<C-H>", "<C-w>h", { desc = "Move focus to the left window" })
	vim.keymap.set("n", "<C-L>", "<C-w>l", { desc = "Move focus to the right window" })
	vim.keymap.set("n", "<C-J>", "<C-w>j", { desc = "Move focus to the lower window" })
	vim.keymap.set("n", "<C-K>", "<C-w>k", { desc = "Move focus to the upper window" })

	-- Split management
	vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
	vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
	vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

	-- Resize splits
	vim.keymap.set("n", "<down>", "<cmd>resize -4<cr>", { desc = "Smaller horizontal split" })
	vim.keymap.set("n", "<up>", "<cmd>resize +4<cr>", { desc = "Bigger horizontal split" })
	vim.keymap.set("n", "<left>", "<cmd>vertical resize -4<cr>", { desc = "Smaller vertical split" })
	vim.keymap.set("n", "<right>", "<cmd>vertical resize +4<cr>", { desc = "Bigger vertical split" })

	-- File management
	vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" })
	vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

	-- Nvim-tree
	--vim.keymap.set("n", "<leader>te", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

	vim.keymap.set("i", "jk", "<esc>", { desc = "Escape insert mode" })

	-- nvim-toggleterm
	vim.keymap.set(
		"n",
		"<leader>tt",
		"<cmd>ToggleFloat<CR>",
		{ noremap = true, silent = true, desc = "Toggle floating terminal" }
	)
	vim.keymap.set(
		"n",
		"<leader>tg",
		"<cmd>ToggleLazyGit<CR>",
		{ noremap = true, silent = true, desc = "Toggle lazyGit floating terminal" }
	)
end

function M.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

return M
