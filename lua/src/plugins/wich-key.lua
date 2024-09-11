return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		local wk = require("which-key")
		wk.setup()

		-- Document existing key chains
		wk.add({
			{ "<leader>c", desc = "[C]ode" },
			{ "<leader>d", desc = "[D]ocument" },
			{ "<leader>r", desc = "[R]ename" },
			{ "<leader>s", desc = "[S]earch" },
			{ "<leader>w", desc = "[W]orkspace" },
			{ "<leader>t", desc = "[T]oggle" },
			{ "<leader>h", desc = "Git [H]unk" },
		})
		-- visual mode
		wk.add({
			{ "<leader>h", desc = "Git [H]unk" },
		}, { mode = "v" })
	end,
}
--- {
---   { "<leader>c", group = "[C]ode" },
---   { "<leader>c_", hidden = true },
---   { "<leader>d", group = "[D]ocument" },
---   { "<leader>d_", hidden = true },
---   { "<leader>h", group = "Git [H]unk" },
---   { "<leader>h_", hidden = true },
---   { "<leader>r", group = "[R]ename" },
---   { "<leader>r_", hidden = true },
---   { "<leader>s", group = "[S]earch" },
---   { "<leader>s_", hidden = true },
---   { "<leader>t", group = "[T]oggle" },
---   { "<leader>t_", hidden = true },
---   { "<leader>w", group = "[W]orkspace" },
---   { "<leader>w_", hidden = true },
--- }
