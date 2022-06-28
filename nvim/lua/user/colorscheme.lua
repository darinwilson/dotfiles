-- local colorscheme = "darkplus"
-- DMWHACK
local colorscheme = "oceanicnext"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
