-- this doesn't seem to be doing anything
--  my goal with this file is to customize nvim-cmp so that it stops picking
--  the first autosuggestion when pressing enter, and instead waiting until I
--  press the arrow keys to pick one of them

return {
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			-- Modify only what we need
			opts.preselect = cmp.PreselectMode.None -- Disable preselection
			opts.enabled = function()
				local disabled_filetypes = { "markdown", "gitcommit" }
				return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
			end
			-- Disable arrow keys to prevent stealing cursor movement
			opts.mapping["<Up>"] = nil
			opts.mapping["<Down>"] = nil
			-- Disable Enter to always insert newline; use <C-y> to confirm selection
			opts.mapping["<CR>"] = nil
		end,
	},
}
