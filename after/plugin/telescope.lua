local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find project files' })
vim.keymap.set('n', '<leader>rg', function()
	builtin.grep_string({search = vim.fn.input("rg: ")});
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
