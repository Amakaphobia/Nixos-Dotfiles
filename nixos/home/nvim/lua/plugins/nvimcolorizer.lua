return {
  {
    "catgoose/nvim-colorizer.lua",

    -- Load when opening or creating a file.
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      options = {
        parsers = {
          -- Enables hex colors, rgb(), hsl(), oklch(),
          -- named colors, and CSS variables.
          css = true,

          -- Detect Tailwind names such as bg-red-500.
          tailwind = {
            enable = true,
          },
        },

        display = {
          -- Draw a colored square directly after the color value.
          mode = "virtualtext",

          virtualtext = {
            char = "■",
            position = "after",
          },
        },
      },
    },
  },
}
