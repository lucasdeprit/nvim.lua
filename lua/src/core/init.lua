require("src.core.options")
local keymaps = require("src.core.keymaps")
keymaps.setup()

vim.cmd('autocmd! TermOpen term://* lua require("src.core.keymaps").set_terminal_keymaps()')
