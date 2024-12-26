return {
	"akinsho/nvim-toggleterm.lua",
	config = function()
		require("toggleterm").setup({
			size = 20, -- Tamaño de la terminal
			open_mapping = [[<c-\>]], -- Mapeo para abrir/cerrar la terminal
			hide_numbers = true, -- Ocultar números en la línea
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2, -- Nivel de sombreado
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float", -- "float", "horizontal", "vertical" o "tab"
			close_on_exit = true, -- Cerrar terminal al salir del proceso
			shell = vim.o.shell, -- Shell predeterminada
			float_opts = {
				border = "curved", -- Bordes: "single", "double", "shadow", "curved"
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end,
}
