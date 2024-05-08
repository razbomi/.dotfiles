local nvim_tmux_nav = require "nvim-tmux-navigation"

local keybindings = {
  left = "<C-h>",
  down = "<C-j>",
  up = "<C-k>",
  right = "<C-l>",
}

nvim_tmux_nav.setup {
  disable_when_zoomed = true,
  keybindings = keybindings,
}
