-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	{ import = "src.plugins" },
	"tpope/vim-sleuth",
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal

-- Crea una terminal flotante
local float_term = Terminal:new({
	direction = "float", -- Dirección flotante
	hidden = true, -- Oculta cuando no está activa
})

-- Función para hacer toggle de la terminal flotante
function _FLOAT_TERM_TOGGLE()
	float_term:toggle()
end

-- Crear un comando para usarlo
vim.api.nvim_create_user_command("ToggleFloat", _FLOAT_TERM_TOGGLE, { desc = "Toggle floating terminal" })

local harpoon = require("harpoon")
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[HARPOON] - Open quick menu" })

vim.keymap.set("n", "<leader>sb", function()
	toggle_telescope(harpoon:list())
end, { desc = "[HARPOON] - Open search with telescope" })

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "[HARPOON] - Add a buffer" })

vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end, { desc = "[HARPOON] - Select 1st buffer" })

vim.keymap.set("n", "<C-j>", function()
	harpoon:list():select(2)
end, { desc = "[HARPOON] - Select 2nd buffer" })

vim.keymap.set("n", "<C-k>", function()
	harpoon:list():select(3)
end, { desc = "[HARPOON] - Select 3rd buffer" })

vim.keymap.set("n", "<C-l>", function()
	harpoon:list():select(4)
end, { desc = "[HARPOON] - Select 4th buffer" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-Tab>", function()
	harpoon:list():prev()
end, { desc = "[HARPOON] - Toggle previous buffer" })
vim.keymap.set("n", "<C-S-Tab>", function()
	harpoon:list():next()
end, { desc = "[HARPOON] - Toggle next buffer" })
