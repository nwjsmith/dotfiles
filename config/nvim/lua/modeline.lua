function getGruvColor(group)
  local guiColor = vim.fn.synIDattr(vim.fn.hlID(group), "fg", "gui")
  local termColor = vim.fn.synIDattr(vim.fn.hlID(group), "fg", "cterm")
  return { guiColor, termColor }
end

if vim.fn.exists("g:lightline") then
  local bg0 = getGruvColor("GruvboxBg0")
  local bg1 = getGruvColor("GruvboxBg1")
  local bg2 = getGruvColor("GruvboxBg2")
  local bg4 = getGruvColor("GruvboxBg4")
  local fg1 = getGruvColor("GruvboxFg1")
  local fg4 = getGruvColor("GruvboxFg4")

  local yellow = getGruvColor("GruvboxYellow")
  local blue = getGruvColor("GruvboxBlue")
  local aqua = getGruvColor("GruvboxAqua")
  local orange = getGruvColor("GruvboxOrange")
  local green = getGruvColor("GruvboxGreen")

  local palette = {
    normal = {},
    inactive = {},
    insert = {},
    terminal = {},
    replace = {},
    visual = {},
    tabline = {},
    normal = {},
  }
  palette.normal.left = { { bg0, fg4, "bold" }, { fg4, bg2 } }
  palette.normal.right = { { bg0, fg4 }, { fg4, bg2 } }
  palette.normal.middle = { { fg4, bg1 } }
  palette.inactive.right = { { bg4, bg1 }, { bg4, bg1 } }
  palette.inactive.left =  { { bg4, bg1 }, { bg4, bg1 } }
  palette.inactive.middle = { { bg4, bg1 } }
  palette.insert.left = { { bg0, blue, "bold" }, { fg1, bg2 } }
  palette.insert.right = { { bg0, blue }, { fg1, bg2 } }
  palette.insert.middle = { { fg4, bg2 } }
  palette.terminal.left = { { bg0, green, "bold" }, { fg1, bg2 } }
  palette.terminal.right = { { bg0, green }, { fg1, bg2 } }
  palette.terminal.middle = { { fg4, bg2 } }
  palette.replace.left = { { bg0, aqua, "bold" }, { fg1, bg2 } }
  palette.replace.right = { { bg0, aqua }, { fg1, bg2 } }
  palette.replace.middle = { { fg4, bg2 } }
  palette.visual.left = { { bg0, orange, "bold" }, { bg0, bg4 } }
  palette.visual.right = { { bg0, orange }, { bg0, bg4 } }
  palette.visual.middle = { { fg4, bg1 } }
  palette.tabline.left = { { fg4, bg2 } }
  palette.tabline.tabsel = { { bg0, fg4 } }
  palette.tabline.middle = { { bg0, bg0 } }
  palette.tabline.right = { { bg0, orange } }
  palette.normal.error = { { bg0, orange } }
  palette.normal.warning = { { bg2, yellow } }

  vim.g.op = palette
  vim.g.ep = vim.fn["lightline#colorscheme#flatten"](palette)

  vim.g["lightline#colorscheme#gruvbox#palette"] = vim.fn["lightline#colorscheme#flatten"](palette)
end

vim.o.showmode = false
-- TODO actually get this working
-- vim.g.lightline = { colorscheme = "gruvbox" }
