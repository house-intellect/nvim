require("settings")
vim.api.nvim_set_option("clipboard", "unnamed")


vim.opt.guifont='JetBrainsMonoNerdFontMono-Regular.ttf'

local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
  -- Common utilities
        'ivanesmantovich/xkbswitch.nvim',
		'nvim-lua/plenary.nvim',

		-- Icons
		'nvim-tree/nvim-web-devicons',

		-- Colorschema
		'rebelot/kanagawa.nvim',

		-- Statusline
		{
			'nvim-lualine/lualine.nvim',
			event = 'BufEnter',
			config = function()
				require('configs.lualine')
			end,
			requires = { 'nvim-web-devicons' },
		},

		-- Treesitter
		{
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdateSync', -- packr.nvim way to trigger run, TSUpdateSync is recommended for treesitter
			config = function()
				require('configs.treesitter')
			end,
		},
		{ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },

		-- Telescope
		 {
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            -- or                            , branch = '0.1.x',
             requires = { {'nvim-lua/plenary.nvim'} }
         },

		
		'onsails/lspkind-nvim',
		{
			'L3MON4D3/LuaSnip',
			-- follow latest release.
	        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	        -- install jsregexp (optional!:).
	        run = "make install_jsregexp"
		},


		-- cmp: Autocomplete
		{
			'hrsh7th/nvim-cmp',
			event = 'InsertEnter',
			config = function()
				require('configs.cmp')
			end,
		},
		'hrsh7th/cmp-nvim-lsp',
		{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
-- LSP
		{
			'neovim/nvim-lspconfig',
			config = function()
				require('configs.lsp')
			end,
		},
		-- LSP diagnostics, code actions, and more via Lua.
		{
			'jose-elias-alvarez/null-ls.nvim',
			config = function()
				require('configs.null-ls')
			end,
			requires = { 'nvim-lua/plenary.nvim' },
		},

		-- Mason: Portable package manager
		{
			'williamboman/mason.nvim',
			config = function()
				require('mason').setup()
			end,
		},
		{
			'williamboman/mason-lspconfig.nvim',
			config = function()
				require('configs.mason-lsp')
			end,
			after = 'mason.nvim',
		},

		-- File manager
		{
			'nvim-neo-tree/neo-tree.nvim',
			branch = 'v2.x',
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-tree/nvim-web-devicons',
				'MunifTanjim/nui.nvim',
			},
		},

		-- Show colors
		{
			'norcalli/nvim-colorizer.lua',
			config = function()
				require('colorizer').setup({ '*' })
			end,
		},

		-- Terminal
		{
			'akinsho/toggleterm.nvim',
			tag = '*',
			config = function()
				require('configs.toggleterm')
			end,
		},

		-- Git
		{
			'lewis6991/gitsigns.nvim',
			config = function()
				require('configs.gitsigns')
			end,
		},

		-- Markdown Preview
		{
			'iamcco/markdown-preview.nvim',
			run = ':call mkdp#util#install()', -- packr.nvim way to trigger run, using raw vim command
		},

		-- autopairs
		{
			'windwp/nvim-autopairs',
			config = function()
				require('configs.autopairs')
			end,
		},

		-- Background Transparent
		{
			'xiyaowong/nvim-transparent',
			config = function()
				require('configs.transparent')
			end,
		}
}

require('xkbswitch').setup()
require("maps")

local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
	vim.cmd("colorscheme kanagawa")
else
	return
end
