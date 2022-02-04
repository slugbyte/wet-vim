"                                   _/      
"  _/      _/      _/    _/_/    _/_/_/_/   
" _/      _/      _/  _/_/_/_/    _/        
"  _/  _/  _/  _/    _/          _/         
"   _/      _/        _/_/_/      _/_/      
" 
" Name: wet-vim
" License: Unlicense
" Maintainer: Duncan Marsh (slugbyte@slugbyte.com)
" Repository: https://github.com/slugbyte/wet-vim

" #### SETUP      #########################################################
if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'wet'
set background=dark

" #### UTIL       #########################################################
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

function! s:TintLink(left, right)
  execute join(['hi', 'clear', a:right], ' ')
  execute join(['hi', 'link', a:right, a:left], ' ')
endfunction

" #### COLOR      #########################################################
let s:color = {}

let s:color.wetblue0 =  [ 25, '#3e6792']
let s:color.wetblue1 =  [ 74, '#9fbdf5']
let s:color.wetblue2  = [117, '#abcbed']

let s:color.weterror = [196, '#D70000']
let s:color.wetalert = [217, '#FFAFAF']
let s:color.wetdebug = [ 65, '#637a60']

let s:color.wetblack = [232, '#080808']
let s:color.wetgray0 = [233, '#191919']
let s:color.wetgray1 = [235, '#343444']
let s:color.wetgray2 = [237, '#444457']
let s:color.wetgray3 = [244, '#778492']
let s:color.wetgray4 = [245, '#8A8A9A']
let s:color.wetshell = [252, '#cdd6df']
let s:color.wetwhite = [231, '#FFFFFF']
let s:color.wetempty = ['NONE', 'NONE']

call s:Tint('WetEmpty', s:color.wetempty, s:color.wetempty, 'NONE')

call s:Tint('WetError', s:color.wetempty, s:color.weterror, 'NONE')
call s:Tint('WetAlert', s:color.wetempty, s:color.wetalert, 'NONE')
call s:Tint('WetDebug', s:color.wetempty, s:color.wetdebug, 'NONE')

call s:Tint('WetBlue0', s:color.wetempty, s:color.wetblue0, 'NONE')
call s:Tint('WetBlue1', s:color.wetempty, s:color.wetblue1, 'NONE')
call s:Tint('WetBlue2', s:color.wetempty, s:color.wetblue2, 'NONE')

call s:Tint('WetGray0', s:color.wetempty, s:color.wetgray0, 'NONE')
call s:Tint('WetGray1', s:color.wetempty, s:color.wetgray1, 'NONE')
call s:Tint('WetGray1', s:color.wetempty, s:color.wetgray2, 'NONE')
call s:Tint('WetGray3', s:color.wetempty, s:color.wetgray3, 'NONE')
call s:Tint('WetGray4', s:color.wetempty, s:color.wetgray4, 'NONE')

call s:Tint('WetWhite', s:color.wetempty, s:color.wetwhite, 'NONE')
call s:Tint('WetBlack', s:color.wetempty, s:color.wetblack, 'NONE')
call s:Tint('WetShell', s:color.wetempty, s:color.wetshell, 'NONE')

" #### GENERAL    #########################################################
call s:TintLink('WetError', 'Error')
call s:TintLink('WetShell', 'Normal')
call s:TintLink('WetBlue0', 'Debug')
call s:TintLink('WetBlue1', 'NonText')
call s:TintLink('WetError', 'ErrorMsg')
call s:TintLink('WetAlert', 'Ignore')
call s:TintLink('WetError', 'Conceal')

call s:Tint('WetBold', s:color.wetempty, s:color.wetblue2, 'BOLD')
call s:Tint('WetItalic', s:color.wetempty, s:color.wetblue2, 'ITALIC')
call s:Tint('WetUnderline', s:color.wetempty, s:color.wetempty, 'UNDERLINE')
call s:Tint('WetUndercurl', s:color.wetempty, s:color.wetempty, 'UNDERCURL')

" #### UI         #########################################################
call s:Tint('Cursor', s:color.wetshell, s:color.weterror, 'NONE')
call s:Tint('Tag', s:color.wetempty, s:color.wetdebug, 'UNDERLINE')
call s:Tint('WildMenu', s:color.wetempty, s:color.wetblue0, 'BOLD')
call s:Tint('TermCursor', s:color.wetshell, s:color.weterror, 'NONE')
call s:Tint('CursorLine', s:color.wetgray0, s:color.wetempty, 'NONE')

call s:TintLink('WetBlue1', 'CursorLineNr')

call s:Tint('Pmenu', s:color.wetgray1, s:color.wetshell, 'NOCOMBINE')
call s:Tint('PmenuSel', s:color.wetshell, s:color.wetblack, 'NONE')
call s:TintLink('Pmenu', 'PmenuThumb')
call s:TintLink('Pmenu', 'ColorColumn')
call s:TintLink('Pmenu', 'NormalFloat')

call s:Tint('Search', s:color.wetshell, s:color.wetblack, 'NONE')
call s:TintLink('Search', 'IncSearch')

call s:Tint('Visual', s:color.wetblue1, s:color.wetgray1, 'NONE')
call s:Tint('VisualNos', s:color.wetblue2, s:color.wetgray1, 'NONE')

call s:Tint('StatusLine', s:color.wetgray0, s:color.wetshell, 'BOLD')

call s:TintLink('WetEmpty', 'Split')
call s:TintLink('WetEmpty', 'LineNr')
call s:TintLink('WetEmpty', 'Folded')
call s:TintLink('WetEmpty', 'Tabline')
call s:TintLink('WetEmpty', 'Directory')
call s:TintLink('WetEmpty', 'FoldColumn')
call s:TintLink('WetEmpty', 'SignColumn')
call s:TintLink('WetEmpty', 'TablineSel')
call s:TintLink('WetEmpty', 'TablineFill')

call s:TintLink('WetEmpty', 'WarningMsg')
call s:TintLink('WetEmpty', 'MoreMsg')
call s:TintLink('WetEmpty', 'ModeMsg')

" #### TYPE       #########################################################
call s:Tint('Character', s:color.wetempty, s:color.wetblue0, 'BOLD')
call s:Tint('Keyword', s:color.wetempty, s:color.wetblue0, 'BOLD')

call s:TintLink('WetDebug', 'Type')
call s:TintLink('WetDebug', 'Typedef')
call s:TintLink('WetDebug', 'Structure')

call s:TintLink('WetBlue1', 'StorageClass')
call s:TintLink('WetBlue1', 'Boolean')
call s:TintLink('WetBlue1', 'Number')
call s:TintLink('WetBlue1', 'Float')
call s:TintLink('WetBlue1', 'String')
call s:TintLink('WetGray3', 'Function')

" #### SYNTAX     #########################################################
call s:Tint('Operator', s:color.wetempty, s:color.wetblue0, 'BOLD')
call s:Tint('MatchParen', s:color.wetblue1, s:color.wetblue0, 'INVERSE')
call s:Tint('Conditional', s:color.wetempty, s:color.wetblue2, 'BOLD')
call s:TintLink('Conditional', 'Label')
call s:TintLink('Conditional', 'Repeat')
call s:TintLink('Conditional', 'Exception')

call s:TintLink('WetBlue0', 'Special')
call s:TintLink('WetBlue1', 'Delimiter')
call s:TintLink('WetBlue1', 'Statement')

call s:TintLink('WetGray3', 'Macro')
call s:TintLink('WetGray4', 'Define')
call s:TintLink('WetGray4', 'PreProc')
call s:TintLink('WetGray4', 'Constant')
call s:TintLink('WetGray4', 'PreCondit')

call s:TintLink('WetDebug', 'Title')
call s:TintLink('WetDebug', 'Include')
call s:TintLink('WetEmpty', 'Identifier')

" #### DIFF       #########################################################
call s:TintLink('WetDebug', 'DiffAdd')
call s:TintLink('WetShell', 'DiffText')
call s:TintLink('WetError', 'DiffDelete')
call s:TintLink('WetBlue1', 'DiffChange')

" TODO @slugbyte add diff file support
call s:TintLink('WetEmpty', 'diffIsA')
call s:TintLink('WetEmpty', 'diffOnly')
call s:TintLink('WetEmpty', 'diffAdded')
call s:TintLink('WetEmpty', 'diffNoEOL')
call s:TintLink('WetEmpty', 'diffDiffer')
call s:TintLink('WetEmpty', 'diffCommon')
call s:TintLink('WetEmpty', 'diffRemoved')
call s:TintLink('WetEmpty', 'diffBDiffer')
call s:TintLink('WetEmpty', 'diffIdentical')

" #### SPELLCHECK #########################################################
call s:TintLink('WetUndercurl', 'SpellBad')
call s:TintLink('WetUndercurl', 'SpellCap')
call s:TintLink('WetUndercurl', 'SpellRare')
call s:TintLink('WetUndercurl', 'SpellLocal')

" #### COMMENT    #########################################################
call s:Tint('Todo', s:color.wetempty, s:color.wetshell, 'BOLD')
call s:Tint('Comment', s:color.wetempty, s:color.wetgray2, 'BOLD')
call s:Tint('SpecialComment', s:color.wetgray2, s:color.wetblack, 'NONE')

" #### HTML/XML   #########################################################
call s:Tint('htmlBold', s:color.wetempty, s:color.wetblue2, 'BOLD')
call s:Tint('htmlItalic', s:color.wetempty, s:color.wetblue2, 'ITALIC')
call s:Tint('htmlUnderline', s:color.wetempty, s:color.wetblue2, 'UNDERCURL')
call s:Tint('htmlBoldItalic', s:color.wetempty, s:color.wetblue2, 'BOLD,ITALIC')
call s:Tint('htmlBoldUnderline', s:color.wetempty, s:color.wetblue2, 'BOLD,UNDERCURL')
call s:Tint('htmlBoldUnderlineItalic', s:color.wetempty, s:color.wetblue2, 'BOLD,ITALIC,UNDERCURL')
call s:Tint('htmlItalicUnderline', s:color.wetempty, s:color.wetblue2, 'ITALIC,UNDERLINE')

call s:Tint('htmlLink', s:color.wetempty, s:color.wetblue0, 'BOLD')
call s:Tint('htmlSpecialTagName', s:color.wetempty, s:color.wetblue0, 'BOLD')

call s:TintLink('htmlBoldItalic', 'htmlItalicBold')
call s:TintLink('htmlBoldUnderline', 'htmlUnderlineBold')
call s:TintLink('htmlItalicUnderline', 'htmlUnderlineItalic')
call s:TintLink('htmlBoldUnderlineItalic', 'htmlUnderlineBoldItalic')
call s:TintLink('htmlBoldUnderlineItalic', 'htmlUnderlineItalicBold')
call s:TintLink('htmlBoldUnderlineItalic', 'htmlItalicUnderlineBold')
call s:TintLink('htmlBoldUnderlineItalic', 'htmlItalicBoldUnderline')
call s:TintLink('htmlBoldUnderlineItalic', 'htmlBoldItalicUnderline')
call s:TintLink('WetBold', 'htmlTag')
call s:TintLink('htmlTag', 'xmlTag')

" #### JSON       #########################################################
call s:TintLink("WetBlue0", "jsonKeyword")
call s:TintLink("WetDebug", "jsonQuote")
call s:TintLink("WetDebug", "jsonBraces")
call s:TintLink("WetBlue1", "jsonString")

" #### MARKDOWN   #########################################################
call s:TintLink('WetBlue1', 'markdownCode')

" #### GIT GUTTER #########################################################
call s:Tint('GitGutterAdd', s:color.wetempty, s:color.wetblue2, 'BOLD')
call s:Tint('GitGutterChange', s:color.wetempty, s:color.wetblue2, 'BOLD')
call s:Tint('GitGutterDelete', s:color.wetempty, s:color.weterror, 'BOLD')
call s:Tint('GitGutterChangeDelete', s:color.wetempty, s:color.wetalert, 'BOLD')

" #### COC        #########################################################
call s:Tint('CocInfoSign', s:color.wetempty, s:color.wetdebug, 'BOLD')
call s:Tint('CocHintSign', s:color.wetblack, s:color.wetdebug, 'NONE')
call s:Tint('CocErrorSign', s:color.wetempty, s:color.weterror, 'BOLD')
call s:Tint('CocWarningSign', s:color.wetempty, s:color.wetalert, 'BOLD')
call s:Tint('CocSelectedText', s:color.wetempty, s:color.wetwhite, 'BOLD')
call s:Tint('CocMarkdownLink', s:color.wetempty, s:color.wetblue2, 'NONE')
call s:Tint('CocHighlightText', s:color.wetempty, s:color.wetempty, 'UNDERCURL')
call s:TintLink('WetBold', 'CocBold')
call s:TintLink('WetBold', 'CocItalic')
