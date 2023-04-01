return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		event = "VeryLazy",
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine-dawn",
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				css = true,
				enable_tailwind = true,
				mode = "virtualtext",
			},
		},
	},
}