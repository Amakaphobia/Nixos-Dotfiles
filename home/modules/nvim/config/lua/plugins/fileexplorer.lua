return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            jump = {
              -- close the tree on file selection
              close = true,
            },
          },
        },
      },
    },
  },
}
