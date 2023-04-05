vim.g.mapleader = ";"
keymap = vim.api.nvim_set_keymap
keymap('i', 'jk', '<Esc>', {})

require "plugins"
require "lsp"
require "mycmp"
require "myfiletype"
require "colorscheme"
require "mytelescope"
require "custom"
require "mycomment"
require "gitsigns"
require "mylualine"
require "mydap"
