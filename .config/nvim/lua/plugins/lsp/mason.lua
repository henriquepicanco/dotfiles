-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup({
	-- max of installations at the same time
	max_concurrent_installers = 5,
})

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"html",
		"cssls",
		"quick_lint_js",
		"tailwindcss",
		"tsserver",
		"sumneko_lua",
		"emmet_ls",
	},
	-- set automatic installation for the above packages
	automatic_installation = true,
})

mason_null_ls.setup({
	-- list of formatters and linters for mason to install
	ensure_installed = {
		"stylua",
		"eslint_d",
		"prettier",
	},
	-- set automatic installation for the above packages
	automatic_installation = true,
})
