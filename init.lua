require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree"), -- filetree
	require("plugins.colortheme"), -- colortheme
	require("plugins.bufferline"), -- the line with tabs in it on top
	require("plugins.lualine"), -- the command line down below (the line that shows the mode)
	require("plugins.treesitter"), -- tool for smarter syntax highlighting
	require("plugins.telescope"), -- file searching
	require("plugins.lsp"), -- lsp setup
	require("plugins.autocompletion"), -- autocompletion
	require("plugins.gitsigns"), -- git intigration
	require("plugins.alpha"), -- nicer nvim startup menu
	require("plugins.none-ls"), -- code formatting after savnig a file
	require("plugins.indent-blankline"), -- indent lines
})
