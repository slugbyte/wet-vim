local c = require("wet.colors")
local lualine = require("wet.lualine")

local NONE = "NONE"

local create_cfg = function(bg, fg, term)
  if term == nil then
    term = NONE
  end
  return {
    type = "tint",
    fg = fg,
    bg = bg,
    term = term,
  }
end

local create_link = function(dest)
  return {
    type = "link",
    dest = dest,
  }
end

local config = {
  wet = {
    WetEmpty = create_cfg(c.empty, c.empty),

    WetError = create_cfg(c.empty, c.error),
    WetAlert = create_cfg(c.empty, c.alert),
    WetDebug = create_cfg(c.empty, c.debug),

    WetBlue0 = create_cfg(c.empty, c.blue0),
    WetBlue1 = create_cfg(c.empty, c.blue1),
    WetBlue2 = create_cfg(c.empty, c.blue2),

    WetGray0 = create_cfg(c.empty, c.gray0),
    WetGray1 = create_cfg(c.empty, c.gray1),
    WetGray2 = create_cfg(c.empty, c.gray2),
    WetGray3 = create_cfg(c.empty, c.gray3),
    WetGray4 = create_cfg(c.empty, c.gray4),

    WetWhite = create_cfg(c.empty, c.white),
    WetBlack = create_cfg(c.empty, c.black),
    WetShell = create_cfg(c.empty, c.shell),
  },
  general = {
    WetBold = create_cfg(c.empty, c.blue2, 'BOLD'),
    WetItalic = create_cfg(c.empty, c.blue2, 'ITALIC'),
    WetUnderline = create_cfg(c.empty, c.empty, 'UNDERLINE'),
    WetUndercurl = create_cfg(c.empty, c.empty, 'UNDERCURL'),
    Error = create_link('WetError'),
    Normal = create_link('WetShell'),
    Debug = create_link('WetBlue0'),
    NonText = create_link('WetBlue1'),
    ErrorMsg = create_link('WetError'),
    Ignore = create_link('WetAlert'),
    Conceal = create_link('WetError'),
    -- ui
    Cursor = create_cfg(c.shell, c.error, 'NONE'),
    Tag = create_cfg(c.empty, c.debug, 'UNDERLINE'),
    WildMenu = create_cfg(c.empty, c.blue0, 'BOLD'),
    TermCursor = create_cfg(c.shell, c.error, 'NONE'),
    CursorLine = create_cfg(c.gray0, c.empty, 'NONE'),
    CursorLineNr = create_link('WetBlue1'),
    Pmenu = create_cfg(c.menu, c.shell, 'NOCOMBINE'),
    PmenuSel = create_cfg(c.shell, c.black, 'NONE'),
    PmenuThumb = create_link('Pmenu'),
    NormalFloat = create_link('Pmenu'),
    ColorColumn = create_cfg(c.gray1, c.empty, 'NONE'),

    Search = create_cfg(c.shell, c.debug, 'NONE'),
    IncSearch = create_link('Search'),

    Visual = create_cfg(c.blue1, c.gray1, 'NONE'),
    VisualNos = create_cfg(c.blue2, c.gray1, 'NONE'),
    StatusLine = create_cfg(c.gray0, c.shell, 'BOLD'),

    VertSplit = create_cfg(c.gray1, c.black, 'NONE'),
    Split = create_cfg(c.gray1, c.black, 'NONE'),
    LineNr = create_link('WetEmpty'),
    Folded = create_link('WetEmpty'),
    Tabline = create_link('WetEmpty'),
    Directory = create_link('WetEmpty'),
    FoldColumn = create_link('WetEmpty'),
    SignColumn = create_link('WetEmpty'),
    TablineSel = create_link('WetEmpty'),
    TablineFill = create_link('WetEmpty'),

    WarningMsg = create_link('WetEmpty'),
    MoreMsg = create_link('WetEmpty'),
    ModeMsg = create_link('WetEmpty'),
    -- type
    Character = create_cfg(c.empty, c.blue0, 'BOLD'),
    Keyword = create_cfg(c.empty, c.blue0, 'BOLD'),

    Type = create_link('WetDebug'),
    Typedef = create_link('WetDebug'),
    Structure = create_link('WetDebug'),

    StorageClass = create_link('WetBlue1'),
    Boolean = create_link('WetBlue1'),
    Number = create_link('WetBlue1'),
    Float = create_link('WetBlue1'),
    String = create_link('WetBlue1'),
    Function = create_link('WetGray3'),
    -- syntax
    Operator = create_cfg(c.empty, c.blue0, 'BOLD'),
    MatchParen = create_cfg(c.blue1, c.blue0, 'INVERSE'),
    Conditional = create_cfg(c.empty, c.blue2, 'BOLD'),
    Label = create_link('Conditional'),
    Repeat = create_link('Conditional'),
    Exception = create_link('Conditional'),

    Special = create_link('WetBlue0'),
    Delimiter = create_link('WetBlue1'),
    Statement = create_link('WetBlue1'),

    Macro = create_link('WetGray3'),
    Define = create_link('WetGray4'),
    PreProc = create_link('WetGray4'),
    Constant = create_link('WetGray4'),
    PreCondit = create_link('WetGray4'),

    Title = create_link('WetDebug'),
    Include = create_link('WetDebug'),
    Identifier = create_link('WetEmpty'),
    -- diff
    DiffAdd = create_link('WetDebug'),
    DiffText = create_link('WetShell'),
    DiffDelete = create_link('WetError'),
    DiffChange = create_link('WetBlue1'),

    -- TODO: better diff
    diffIsA = create_link('WetEmpty'),
    diffOnly = create_link('WetEmpty'),
    diffAdded = create_link('WetEmpty'),
    diffNoEOL = create_link('WetEmpty'),
    diffDiffer = create_link('WetEmpty'),
    diffCommon = create_link('WetEmpty'),
    diffRemoved = create_link('WetEmpty'),
    diffBDiffer = create_link('WetEmpty'),
    diffIdentical = create_link('WetEmpty'),

    -- spellcheck
    SpellBad = create_link('WetUndercurl'),
    SpellCap = create_link('WetUndercurl'),
    SpellRare = create_link('WetUndercurl'),
    SpellLocal = create_link('WetUndercurl'),
    -- comment
    Todo = create_cfg(c.empty, c.shell, 'BOLD'),
    Comment = create_cfg(c.empty, c.gray2, 'BOLD'),
    SpecialComment = create_cfg(c.gray2, c.black, 'NONE'),

    -- whitespace

    -- match ExtraWhitespace /\s\+$/
    ExtraWhitespace = create_cfg(c.gray1, c.empty, 'NONE'),

    -- HTML
    htmlBold = create_cfg(c.empty, c.blue2, 'BOLD'),
    htmlItalic = create_cfg(c.empty, c.blue2, 'ITALIC'),
    htmlUnderline = create_cfg(c.empty, c.blue2, 'UNDERCURL'),
    htmlBoldItalic = create_cfg(c.empty, c.blue2, 'BOLD,ITALIC'),
    htmlBoldUnderline = create_cfg(c.empty, c.blue2, 'BOLD,UNDERCURL'),
    htmlBoldUnderlineItalic = create_cfg(c.empty, c.blue2, 'BOLD,ITALIC,UNDERCURL'),
    htmlItalicUnderline = create_cfg(c.empty, c.blue2, 'ITALIC,UNDERLINE'),

    htmlLink = create_cfg(c.empty, c.blue0, 'BOLD'),
    htmlSpecialTagName = create_cfg(c.empty, c.blue0, 'BOLD'),

    htmlItalicBold = create_link('htmlBoldItalic'),
    htmlUnderlineBold = create_link('htmlBoldUnderline'),
    htmlUnderlineItalic = create_link('htmlItalicUnderline'),
    htmlUnderlineBoldItalic = create_link('htmlBoldUnderlineItalic'),
    htmlUnderlineItalicBold = create_link('htmlBoldUnderlineItalic'),
    htmlItalicUnderlineBold = create_link('htmlBoldUnderlineItalic'),
    htmlItalicBoldUnderline = create_link('htmlBoldUnderlineItalic'),
    htmlBoldItalicUnderline = create_link('htmlBoldUnderlineItalic'),
    htmlTag = create_link('WetBold'),
    xmlTag = create_link('htmlTag'),
    htmlTagName = create_link("WetBlue0"),
    -- jsx
    jsxTag = create_link("WetBold"),
    jsxTagName = create_link("WetBlue0"),

  },
}

return {
  config = config,
  colors = c,
  lualine = lualine,
}
