if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

---@param kind string
---@param frames string[]
---@return StringMap
local function build_frames(kind, frames)
  local kinds = {}
  for index, frame in ipairs(frames) do
    kinds[kind .. index] = frame
  end
  return kinds
end

return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = function(_, opts)
    local icons = {}
    -- configure the loading of the lsp in the status line
    icons = vim.tbl_deep_extend(
      "force",
      icons,
      build_frames("LSPLoading", { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" })
    )

    local text_icons = {
      -- configure neotree
      FolderClosed = "+",
      FolderEmpty = "-",
      FolderOpen = "-",
    }

    -- configure the loading of the lsp in the status line
    text_icons = vim.tbl_deep_extend("force", text_icons, build_frames("LSPLoading", { "|", "/", "-", "\\" }))

    return vim.tbl_deep_extend("force", opts, {
      icons = icons,
      text_icons = text_icons,
    })
  end,
}
