local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
	return
end

masonlsp.setup({
	automatic_installation = true,
	ensure_installed = {
	"ts_ls",
  "cssls",
  "tailwindcss",
  "html",
  "jsonls",
  "eslint",
  "pyright",
  "kotlin_language_server",
  "harper_ls",
  "markdown_oxide",
  "groovyls",
  "bashls",
  "dockerls",
  "elixirls",
  "golangci_lint_ls",
  "graphql",
  "powershell_es",
  "sqls",
  "yamlls"},
})
