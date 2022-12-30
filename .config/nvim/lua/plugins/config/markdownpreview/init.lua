return function()
	local css_path = vim.fn.stdpath("config") .. "/lua/plugins/config/markdownpreview/styles/github.css"
	vim.g.mkdp_markdown_css = vim.fn.expand(css_path)
	vim.g.mkdp_browser = "google-chrome-stable"
	vim.g.mkdp_filetypes = { "markdown", "md", "MD" }
end
