local lsp_zero = require('lsp-zero')


local cmp = require ('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'pylsp',
	'bashls',
	'html',
	'jsonls',
	'quick_lint_js',
	'lua_ls',
	'sqlls',
},
	handlers = {
		lsp_zero.default_setup,
	},
})

cmp.setup({
	mappings = cmp.mapping.preset.insert({
	['<C-[>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-]>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-p>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp_zero.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp_zero.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp_zero.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp_zero.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp_zero.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp_zero.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp_zero.buf.signature_help() end, opts)
end)

lsp_zero.setup()
