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
			opts.mapping["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_selected_entry() then
						cmp.confirm({ select = false }) -- Confirm only if explicitly selected
					else
						cmp.close() -- Close menu
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true) -- Insert newline
					end
				end,
			})
		end,
	},
}
