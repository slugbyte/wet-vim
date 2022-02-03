" Name: wet-vim
" Maintainer: Duncan Marsh (slugbyte@slugbyte.com)
" Repository: https://github.com/slugbyte/wet-vim

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif


" SETUP
hi clear

if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'wet'
set background=dark

" create utilitys
function! s:Tint(group, bg, fg, term)
  execute join([ 'hi',
          \ a:group,
          \ 'ctermfg=' . a:fg[0],
          \ 'ctermbg=' . a:bg[0],
          \ 'guifg='   . a:fg[1],
          \ 'guibg='   . a:bg[1],
          \ 'gui='     . a:term[:-1],
          \ 'cterm='   . a:term[:-1],
          \ ], ' ')
endfunction

function! s:Link(left, right)
  execute join(['hi', 'clear', a:left], ' ')
  execute join(['hi', 'link', a:left, a:right], ' ')
endfunction

function! s:UpdateTerm(group, value)
  execute join(['hi', group, 'cterm=' . value, 'gui=' . value], ' ')
endfunction

" DEFINE COLOR PALLET
let s:color = {}

" sky
let s:color.wetblue0 = [104, '#3e6792']
let s:color.wetblue1 = [111, '#9fbdf5']
let s:color.wetblue2  = [64, '#abcbed']

let s:color.weterror = [160, '#D70000']
let s:color.wetwarning = [217, '#FFAFAF']
let s:color.wethint = [230, '#FFFFD7']
let s:color.wetinfo = [143, '#637a60']

let s:color.wetblack = [232, '#080808']
let s:color.wetgray0 = [232, '#191919']
let s:color.wetgray1 = [235, '#343444']
let s:color.wetgray2 = [236, '#444457']
let s:color.wetgray3 = [240, '#585868']
let s:color.wetgray4= [177, '#45848b']
let s:color.wetgray5 = [60, '#778492']
let s:color.wetgray6 = [245, '#8A8A9A']
let s:color.wetoffwhite = [255, '#cdd6df']
let s:color.wetwhite = [231, '#FFFFFF']
let s:color.none = ['NONE', 'NONE']

" #### COLOR      #########################################################
call s:Tint('None', s:color.none, s:color.none, 'NONE')

call s:Tint('WetError', s:color.none, s:color.weterror, 'NONE')
call s:Tint('WetWarning', s:color.none, s:color.wetwarning, 'NONE')
call s:Tint('WetHint', s:color.none, s:color.wethint, 'NONE')
call s:Tint('WetInfo', s:color.none, s:color.wetinfo, 'NONE')

call s:Tint('WetBlue0', s:color.none, s:color.wetblue0, 'NONE')
call s:Tint('WetBlue1', s:color.none, s:color.wetblue1, 'NONE')
call s:Tint('WetBlue2', s:color.none, s:color.wetblue2, 'NONE')

call s:Tint('WetGray0', s:color.none, s:color.wetgray0, 'NONE')
call s:Tint('WetGray1', s:color.none, s:color.wetgray1, 'NONE')
call s:Tint('WetGray3', s:color.none, s:color.wetgray3, 'NONE')
call s:Tint('WetGray4', s:color.none, s:color.wetgray4, 'NONE')
call s:Tint('WetGray5', s:color.none, s:color.wetgray5, 'NONE')
call s:Tint('WetGray6', s:color.none, s:color.wetgray6, 'NONE')

" #### GENERAL    #########################################################
call s:Tint('Normal', s:color.wetblack, s:color.wetoffwhite, 'NONE')
call s:Tint('NonText', s:color.none, s:color.wetblue1, 'NONE')
call s:Tint('Underlined', s:color.none, s:color.none, 'UNDERLINE')
call s:Tint('Undercurl', s:color.none, s:color.none, 'UNDERCURL')
call s:Tint('WetBold', s:color.none, s:color.wetblue2, 'BOLD')
call s:Tint('WetItalic', s:color.none, s:color.wetblue2, 'ITALIC')

" #### UI         #########################################################
call s:Tint('WildMenu', s:color.none, s:color.wetblue0, 'BOLD')
call s:Tint('CursorLine', s:color.wetgray0, s:color.none, 'NONE')
call s:Tint('CursorLineNr', s:color.none, s:color.wetgray6, 'NONE')
call s:Tint('Cursor', s:color.wetoffwhite, s:color.weterror, 'NONE')
call s:Tint('TermCursor', s:color.wetoffwhite, s:color.weterror, 'NONE')
call s:Link('Split', 'None')
call s:Tint('Pmenu', s:color.wetgray1, s:color.wetoffwhite, 'NOCOMBINE')
call s:Tint('PmenuSel', s:color.wetoffwhite, s:color.wetblack, 'NONE')
call s:Link('PmenuThumb', 'Pmenu')
call s:Link('PmenuSbar', 'None')
call s:Tint('Search', s:color.wetoffwhite, s:color.wetblack, 'NONE')
call s:Link('IncSearch', 'Search')
call s:Link('ColorColumn', 'Pmenu')
call s:Link('SignColumn', 'None')
call s:Link('StatusLine', 'None')
call s:Link('Tabline', 'None')
call s:Link('TablineSel', 'None')
call s:Link('TablineFill', 'None')
call s:Link('Folded', 'None')
call s:Tint('Error', s:color.none , s:color.weterror, 'NONE')
call s:Link('ErrorMsg', 'Error')
call s:Link('FoldColumn', 'None')
call s:Link('Directory', 'None')
call s:Link('LineNr', 'None')

" #### DIFF       #########################################################
call s:Link('DiffAdd', 'None')
call s:Link('DiffDelete', 'None')
call s:Link('DiffChange', 'None')
call s:Link('DiffText', 'None')
call s:Link('diffBDiffer', 'None')
call s:Link('diffCommon', 'None')
call s:Link('diffDiffer', 'None')
call s:Link('diffIdentical', 'None')
call s:Link('diffIsA', 'None')
call s:Link('diffNoEOL', 'None')
call s:Link('diffOnly', 'None')
call s:Link('diffRemoved', 'None')
call s:Link('diffAdded', 'None')

" #### SPELLCHECK #########################################################
call s:Tint('SpellBad', s:color.none, s:color.none, 'UNDERCURL')
call s:Link('SpellCap', 'SpellBad')
call s:Link('SpellLocal', 'SpellBad')
call s:Link('SpellRare', 'SpellBad')

" #### TYPE       #########################################################
call s:Tint('Type', s:color.none, s:color.wetinfo, 'NONE')
call s:Link('Include', 'Type')
call s:Tint('Keyword', s:color.none, s:color.wetblue0, 'BOLD')
call s:Tint('Boolean', s:color.none, s:color.wetblue1, 'NONE')
call s:Tint('Number', s:color.none, s:color.wetblue1, 'NONE')
call s:Tint('Float', s:color.none, s:color.wetblue1, 'NONE')
call s:Tint('Character', s:color.none, s:color.wetblue0, 'BOLD')
call s:Link('Typedef', 'Type')
call s:Link('Operator', 'Keyword')
call s:Link('NormalFloat', 'Pmenu')
call s:Tint('Visual', s:color.wetblue1, s:color.wetgray1, 'NONE')

" #### SYNTAX     #########################################################
call s:Link('Function', 'WetGray5')
call s:Link('String', 'WetBlue1')
call s:Tint('Delimiter', s:color.none, s:color.wetblue1, 'NONE')
call s:Tint('Statement', s:color.none, s:color.wetblue1, 'NONE')
call s:Tint('Title', s:color.none, s:color.wetinfo, 'NONE')
call s:Tint('StorageClass', s:color.none, s:color.wetblue1, 'NONE')
call s:Tint('PreProc', s:color.none, s:color.wetgray6, 'NONE')
call s:Tint('MatchParen', s:color.wetblue1, s:color.wetblue0, 'INVERSE')
call s:Tint('Special', s:color.none, s:color.wetblue0, 'NONE')
call s:Tint('Constant', s:color.none, s:color.wetgray6, 'NONE')
call s:Tint('Conditional', s:color.none, s:color.wetblue2, 'BOLD')
call s:Link('Define', 'PreProc')
call s:Link('PreCondit', 'PreProc')
call s:Link('Include', 'Type')
call s:Link('Macro', 'Function')
call s:Link('Label', 'None')
call s:Link('Repeat', 'None')
call s:Link('Tag', 'None')
call s:Link('Exception', 'None')
call s:Link('Identifier', 'None')
call s:Link('Conceal', 'None')
call s:Link('WarningMsg', 'None')
call s:Link('ModeMsg', 'None')
call s:Link('MoreMsg', 'None')
call s:Link('Ignore', 'None')
call s:Link('VisualNOS', 'None')
call s:Link('Debug', 'None')

" #### OTHER      #########################################################
call s:Link('HelpCommand', 'None')
call s:Link('HelpExample', 'None')
call s:Link('helpleadblank', 'None')
call s:Link('helpNone', 'None')

" #### COMMENT    #########################################################
call s:Tint('Comment', s:color.none, s:color.wetgray2, 'BOLD')
call s:Tint('SpecialComment', s:color.wetgray2, s:color.wetblack, 'NONE')
call s:Tint('Todo', s:color.none, s:color.wetoffwhite, 'BOLD')

" #### HTML/XML   #########################################################
call s:Tint('htmlBold', s:color.none, s:color.wetblue2, 'BOLD')
call s:Tint('htmlBoldItalic', s:color.none, s:color.wetblue2, 'BOLD,ITALIC')
call s:Tint('htmlBoldUnderline', s:color.none, s:color.wetblue2, 'BOLD,UNDERCURL')
call s:Tint('htmlBoldUnderlineItalic', s:color.none, s:color.wetblue2, 'BOLD,ITALIC,UNDERCURL')
call s:Tint('htmlItalic', s:color.none, s:color.wetblue2, 'ITALIC')
call s:Tint('htmlItalicUnderline', s:color.none, s:color.wetblue2, 'ITALIC,UNDERLINE')
call s:Tint('htmlUnderline', s:color.none, s:color.wetblue2, 'UNDERCURL')
call s:Tint('htmlLink', s:color.none, s:color.wetblue0, 'BOLD')
call s:Link('htmlUnderlineBold', 'htmlBoldUnderline')
call s:Link('htmlUnderlineItalic', 'htmlItalicUnderline')
call s:Link('htmlUnderlineBoldItalic', 'htmlBoldUnderlineItalic')
call s:Link('htmlUnderlineItalicBold', 'htmlBoldUnderlineItalic')
call s:Link('htmlItalicBold', 'htmlBoldItalic')
call s:Link('htmlItalicUnderlineBold', 'htmlBoldUnderlineItalic')
call s:Link('htmlItalicBoldUnderline', 'htmlBoldUnderlineItalic')
call s:Link('htmlBoldItalicUnderline', 'htmlBoldUnderlineItalic')
call s:Link('htmlTag', 'WetBold')
call s:Link('xmlTag', 'htmlTag')

" #### MARKDOWN   #########################################################
call s:Tint('markdownCode', s:color.none, s:color.wetblue1, 'NONE')

" #### GIT GUTTER #########################################################
call s:Tint('GitGutterAdd', s:color.none, s:color.wetblue2, 'BOLD')
call s:Tint('GitGutterChange', s:color.none, s:color.wetblue2, 'BOLD')
call s:Tint('GitGutterDelete', s:color.none, s:color.weterror, 'BOLD')
call s:Tint('GitGutterChangeDelete', s:color.none, s:color.wetwarning, 'BOLD')

" #### COC        #########################################################
call s:Tint('CocErrorSign', s:color.none, s:color.weterror, 'BOLD')
call s:Tint('CocWarningSign', s:color.none, s:color.wetwarning, 'BOLD')
call s:Tint('CocInfoSign', s:color.none, s:color.wetinfo, 'BOLD')
call s:Tint('CocHintSign', s:color.none, s:color.wethint, 'BOLD')
call s:Tint('CocHintSign', s:color.none, s:color.none, 'BOLD')
call s:Tint('CocHighlightText', s:color.none, s:color.none, 'UNDERCURL')
call s:Tint('CocSelectedText', s:color.none, s:color.wetwhite, 'BOLD')
call s:Tint('CocMarkdownLink', s:color.none, s:color.wetblue2, 'NONE')
call s:Link('CocBold', 'WetBold')
call s:Link('CocItalic', 'WetBold')
