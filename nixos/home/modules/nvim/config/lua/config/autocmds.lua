-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


-- add a space after a # declaring a nix line comment:
local function normalize_nix_comment_spacing(bufnr)
  local parser_ok, parser = pcall(vim.treesitter.get_parser, bufnr, "nix")

  if not parser_ok then
    return
  end

  local tree = parser:parse()[1]

  if not tree then
    return
  end

  local query = vim.treesitter.query.parse("nix", "(comment) @comment")
  local insertions = {}

  for _, node in query:iter_captures(tree:root(), bufnr, 0, -1) do
    local text = vim.treesitter.get_node_text(node, bufnr)

    local is_line_comment = text:sub(1, 1) == "#"
    local has_content = #text > 1
    local already_has_space = text:sub(1, 2) == "# "
    local is_shebang = text:sub(1, 2) == "#!"

    if is_line_comment and has_content and not already_has_space and not is_shebang then
      local row, column = node:start()

      table.insert(insertions, {
        row = row,
        column = column + 1,
      })
    end
  end

  -- Work backwards so earlier insertions do not invalidate later positions.
  for index = #insertions, 1, -1 do
    local insertion = insertions[index]

    vim.api.nvim_buf_set_text(
      bufnr,
      insertion.row,
      insertion.column,
      insertion.row,
      insertion.column,
      { " " }
    )
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.nix",
  callback = function(event)
    normalize_nix_comment_spacing(event.buf)
  end,
})
