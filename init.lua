-----------
--tabspaces
-----------
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.smartindent = true

-----------------------
--relative line numbers
-----------------------
vim.wo.number = true
vim.wo.relativenumber = true

--------
--others
--------
vim.g.hidden = true
vim.g.scrolloff = 8
vim.wo.scrolloff = 8
vim.wo.signcolumn = 'yes'
noswapfile = true
incsearch = true

---------
--Keymaps
---------
--shortcut for keymap
local keymap = vim.api.nvim_set_keymap
--keymap for savign with ctrl+s 
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>', {})
--shortcut for noremap=ture
local opts = { noremap = true }
--keymap for split navigation
--keymap('n', '<c-j>', 'c-w>j', opts)
--keymap('n', '<c-h>', 'c-w>h', opts)
--keymap('n', '<c-k>', 'c-w>k', opts)
--keymap('n', '<c-l>', 'c-w>l', opts)

---------------------------------
--Packer isntallation and Plugins
---------------------------------
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use 'neovim/nvim-lspconfig'
    use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/nvim-lsp-installer'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
    -- Put this at the end after all plugins
      if packer_bootstrap then
         require('packer').sync()
        end
end)



local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

--------------
--Color Scheme
--------------
vim.g.colors_name = 'gruvbox'
vim.opt.background = 'dark'

----------------
--Lualine config
----------------
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
