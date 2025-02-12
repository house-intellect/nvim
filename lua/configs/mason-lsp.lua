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
  "csharp_language_server",
  "kotlin_language_server",
  "java_language_server",
  "markdown_oxide",
  "groovyls",
  "bashls",
  "dockerls",
  "elixirls",
  "golangci_lint_ls",
  "graphql",
  "powershell_es",
  "r_language_server",
  "sqls",
  "yamlls"},
})
