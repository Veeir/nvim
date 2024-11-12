-- Options

local options = {
	number = true,
    relativenumber = true,
	smartcase = true,
	showmode = true,
	cindent = true,
	cinoptions = "cino+={2",

	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
}


local silent = { silent = true }

vim.keymap.set('n', '<Leader>e', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>')

vim.api.nvim_create_user_command('RC', 'e /Users/jake/.config/nvim/', {})



for option, value in pairs(options) do
    vim.opt[option] = value;
end


-- Plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
{'neovim/nvim-lspconfig'},
{'hrsh7th/nvim-cmp'},
{'hrsh7th/cmp-nvim-lsp'},
{"nvim-java/nvim-java"},
{
  "whizikxd/naysayer-colors.nvim",
  lazy = false,
  config = function()
    vim.cmd("colorscheme naysayer")
  end
}
})





require('java').setup()
local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()



local servers = { 'clangd', 'lua_ls', 'jdtls'}

for index, server in ipairs(servers) do
    lspconfig[server].setup{
        capabilities = capabilities,
    }
end

lspconfig.lua_ls.setup({
capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
})

-- nvim-cmp setup
local cmp = require('cmp')

cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' }
  },
}


-- Disable signs, Causing left padding to fuck up when entering insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    }
)

--vim.cmd[[colorscheme no-clown-fiesta]]



