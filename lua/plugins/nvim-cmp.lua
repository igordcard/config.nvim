-- this doesn't seem to be doing anything
--  my goal with this file is to customize nvim-cmp so that it stops picking
--  the first autosuggestion when pressing enter, and instead waiting until I
--  press the arrow keys to pick one of them

return {
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local cmp = require("cmp")
			local conf = require("lazyvim.plugins.cmp") -- Import LazyVim’s default config
			-- Modify only what we need
			conf.preselect = cmp.PreselectMode.None -- Disable preselection
			conf.mapping["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_selected_entry() then
						cmp.confirm({ select = false }) -- Confirm only if explicitly selected
					else
						cmp.close() -- Close menu
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", true) -- Insert newline
					end
				end,
			})
			return conf
		end,
	},
}
