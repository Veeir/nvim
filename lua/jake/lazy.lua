local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup({
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'MunifTanjim/prettier.nvim'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
{'nelsyeung/twig.vim'},
{'bluz71/vim-moonfly-colors'},
{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
{ "nvim-treesitter/nvim-treesitter-context" },
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
},
{'nvim-lualine/lualine.nvim'},
{'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' }
}
})


local lsp_zero = require('lsp-zero')
local options = { theme = 'moonfly' }

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{
  filetypes = {"html", "twig"}
}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.pyright.setup{}
require('lualine').setup {
  options = options
}
