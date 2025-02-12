local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- TypeScript
nvim_lsp.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- CSS
nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Tailwind
nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- HTML
nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- JSON
nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Eslint
nvim_lsp.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Python
nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Python
nvim_lsp.csharp_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.kotlin_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.java_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.markdown_oxide.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.groovyls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})


nvim_lsp.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.elixirls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.golangci_lint_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
nvim_lsp.graphql.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.powershell_es.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.r_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.sqls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})




