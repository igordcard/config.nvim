# Neovim Config

My Neovim configuration using LazyVim.

## Installation

Clone to `~/.config/nvim`:

```bash
git clone https://github.com/igordcard/config.nvim ~/.config/nvim
```

Open Neovim; LazyVim installs plugins automatically.

## Key Features

- **Plugins**: Harpoon, Telescope, UndoTree, Vim-Fugitive, Rose-Pine theme, nvim-cmp (customized).
- **Leader Key**: Space
- **Disabled Completion**: Markdown, Git commits
- **Custom Keymaps**: See `lua/igordc/remap.lua` and plugin configs.

## Notes

- Uses LazyVim extras: DAP, nvim-cmp
- Configs moved from `after/plugin/` to plugin specs for lazy loading.