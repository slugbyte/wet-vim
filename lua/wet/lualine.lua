local colors = require("wet.colors")

return {
  normal = {
    a = { bg = colors.wetgray0, fg = colors.wetblue1, gui = 'bold' },
    b = { bg = colors.wetgray1, fg = colors.wetblue1 },
    c = { bg = colors.wetgray0, fg = colors.wetblue1 },
  },
  insert = {
    a = { bg = colors.wetblue0, fg = colors.wetwhite, gui = 'bold' },
    b = { bg = colors.wetgray1, fg = colors.wetblue1 },
    c = { bg = colors.wetgray0, fg = colors.wetblue1 },
  },
  visual = {
    a = { bg = colors.wetblue1, fg = colors.wetblack, gui = 'bold' },
    b = { bg = colors.wetgray1, fg = colors.wetblue1 },
    c = { bg = colors.wetgray0, fg = colors.wetblue1 },
  },
  replace = {
    a = { bg = colors.wetblue2, fg = colors.wetblack, gui = 'bold' },
    b = { bg = colors.wetgray1, fg = colors.wetblue1 },
    c = { bg = colors.wetgray0, fg = colors.wetblue1 },
  },
  command = {
    a = { bg = colors.wetdebug, fg = colors.wetblack, gui = 'bold' },
    b = { bg = colors.wetgray1, fg = colors.wetdebug },
    c = { bg = colors.wetgray0, fg = colors.wetdebug },
  },
  inactive = {
    a = { bg = colors.wetblack, fg = colors.wetgray2, gui = 'bold' },
    b = { bg = colors.wetblack, fg = colors.wetgray2 },
    c = { bg = colors.wetblack, fg = colors.wetgray2 },
  },
}
