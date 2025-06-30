require("bliss")

vim.cmd.colorscheme("catppuccin")
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

require('lualine').setup {
	options = {
		theme = 'catppuccin'
	}
}
