return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",

      -- Main editor inherits Kitty's opacity.
      transparent_background = true,

      -- Floats retain a Catppuccin background so winblend can blend it.
      float = {
        transparent = false,
        solid = false,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
