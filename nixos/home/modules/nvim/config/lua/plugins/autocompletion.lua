return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        --<Tab> accepts the selected completion.
        -- <Tab> moves forward through snippet positions when applicable.
        -- <Tab> behaves normally when there is nothing to complete.
        -- <S-Tab> moves backward through snippet positions.
        -- <Enter> returns to inserting a newline instead of accepting completion.
        preset = "super-tab",
      },
    },
  },
}
