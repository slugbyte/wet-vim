local colors = {
  wetblue0 = '#3e6792',
  wetblue1 = '#9fbdf5',
  wetblue2 = '#abcbed',
  weterror = '#D70000',
  wetalert = '#FFAFAF',
  wetdebug = '#637a60',
  wetblack = '#080808',
  wetgray0 = '#191919',
  wetgray1 = '#343444',
  wetgray2 = '#444457',
  wetgray3 = '#778492',
  wetgray4 = '#8A8A9A',
  wetshell = '#cdd6df',
  wetwhite = '#FFFFFF',
}

return {
  colors = colors,
  lualine = {
    normal = {
      a = { bg = colors.wetgray0, fg = colors.wetblue1, gui = 'bold' },
      b = { bg = colors.wetgray1, fg = colors.wetblue1},
      c = { bg = colors.wetgray0, fg = colors.wetblue1},
    },
    insert = { 
      a = { bg = colors.wetblue0, fg = colors.wetwhite, gui = 'bold' },
      b = { bg = colors.wetgray1, fg = colors.wetblue1},
      c = { bg = colors.wetgray0, fg = colors.wetblue1},
    },
    visual = {
      a = { bg = colors.wetblue1, fg = colors.wetblack, gui = 'bold' },
      b = { bg = colors.wetgray1, fg = colors.wetblue1},
      c = { bg = colors.wetgray0, fg = colors.wetblue1},
    },
    replace = {
      a = { bg = colors.wetblue2, fg = colors.wetblack, gui = 'bold' },
      b = { bg = colors.wetgray1, fg = colors.wetblue1},
      c = { bg = colors.wetgray0, fg = colors.wetblue1},
    },
    command = {
      a = { bg = colors.wetdebug, fg = colors.wetblack, gui = 'bold' },
      b = { bg = colors.wetgray1, fg = colors.wetdebug},
      c = { bg = colors.wetgray0, fg = colors.wetdebug},
    },
    inactive = {
      a = { bg = colors.wetblack, fg = colors.wetgray2, gui = 'bold' },
      b = { bg = colors.wetblack, fg = colors.wetgray2 },
      c = { bg = colors.wetblack, fg = colors.wetgray2 },
    },
  }
}
