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
let s:color.wetwarn = [180, '#f5aa85' ]
let s:color.wetdebug = [28, '#637a60']
let s:color.wetgreen0 = [35, '#bce2b7']
let s:color.wetgreen1 = [35, '#8aad85']

let s:color.wetblack = [232, '#080808']
let s:color.wetgray0 = [233, '#191919']
let s:color.wetgray1 = [235, '#343444']
let s:color.wetgray2 = [237, '#444457']
let s:color.wetgray3 = [241, '#7c7c9c']
let s:color.wetgray4 = [244, '#778492']
let s:color.wetgray5 = [245, '#8A8A9A']
let s:color.wetgray6 = [245, '#AAAAAA']
let s:color.wetshell = [252, '#cdd6df']
let s:color.wetwhite = [231, '#FFFFFF']
let s:color.wetempty = ['NONE', 'NONE']

call s:Tint('WetEmpty', s:color.wetempty, s:color.wetempty, 'NONE')

call s:Tint('WetError', s:color.wetempty, s:color.weterror, 'NONE')
call s:Tint('WetDebug', s:color.wetempty, s:color.wetdebug, 'NONE')

call s:Tint('WetBlue0', s:color.wetempty, s:color.wetblue0, 'NONE')
call s:Tint('WetBlue1', s:color.wetempty, s:color.wetblue1, 'NONE')
call s:Tint('WetBlue2', s:color.wetempty, s:color.wetblue2, 'NONE')

call s:Tint('WetGray0', s:color.wetempty, s:color.wetgray0, 'NONE')
call s:Tint('WetGray1', s:color.wetempty, s:color.wetgray1, 'NONE')
call s:Tint('WetGray1', s:color.wetempty, s:color.wetgray2, 'NONE')
call s:Tint('WetGray3', s:color.wetempty, s:color.wetgray4, 'NONE')
call s:Tint('WetGray4', s:color.wetempty, s:color.wetgray5, 'NONE')

call s:Tint('WetWhite', s:color.wetempty, s:color.wetwhite, 'NONE')
call s:Tint('WetBlack', s:color.wetempty, s:color.wetblack, 'NONE')
call s:Tint('WetShell', s:color.wetempty, s:color.wetshell, 'NONE')

" #### GENERAL    #########################################################
call s:TintLink('WetError', 'Error')
call s:TintLink('WetShell', 'Normal')
call s:TintLink('WetBlue0', 'Debug')
call s:TintLink('WetBlue1', 'NonText')
call s:TintLink('WetError', 'ErrorMsg')
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

call s:Tint('Pmenu', s:color.wetgray0, s:color.wetshell, 'NOCOMBINE')
call s:Tint('PmenuSel', s:color.wetdebug, s:color.wetempty, 'NONE')
call s:TintLink('Pmenu', 'PmenuThumb')
call s:TintLink('Pmenu', 'NormalFloat')

" nvim cmp
call s:Tint('CmpItemKind', s:color.wetempty, s:color.wetshell, 'NONE')
" call s:Tint('CmpItemKindSnippet', s:color.wetempty, s:color.wetblue0, 'NONE')
call s:Tint('CmpItemKindText', s:color.wetempty, s:color.wetgray5, 'NONE')
call s:Tint('CmpItemAbbr', s:color.wetempty, s:color.wetshell, 'NONE')
call s:Tint('CmpItemAbbrMatch', s:color.wetempty, s:color.wetempty, 'NONE')
call s:Tint('CmpItemAbbrMatchFuzzy', s:color.wetempty, s:color.wetempty, 'NONE')
call s:Tint('CmpItemAbbrDeprecated', s:color.wetempty, s:color.wetgray2, 'NONE')

call s:Tint('ColorColumn', s:color.wetgray1, s:color.wetempty, 'NONE')

call s:Tint('Search', s:color.wetdebug, s:color.wetblack, 'NONE')
call s:Tint('CurSearch', s:color.wetwhite, s:color.wetdebug, 'NONE')
call s:Tint('IncSearch', s:color.wetwhite, s:color.wetdebug, 'NONE')

call s:Tint('Visual', s:color.wetdebug, s:color.wetshell, 'NONE')
call s:Tint('VisualNos', s:color.wetdebug, s:color.wetshell, 'NONE')

call s:Tint('Visual', s:color.wetdebug, s:color.wetshell, 'NONE')
call s:Tint('VisualNos', s:color.wetdebug, s:color.wetshell, 'NONE')

call s:Tint('StatusLine', s:color.wetgray0, s:color.wetshell, 'BOLD')

call s:Tint('VertSplit', s:color.wetgray1, s:color.wetblack, 'NONE')
call s:Tint('Split', s:color.wetgray1, s:color.wetblack, 'NONE')

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
"
" #### WHITESPACE #########################################################
match ExtraWhitespace /\s\+$/
call s:Tint('ExtraWhitespace', s:color.wetgray1, s:color.wetempty, 'NONE')

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
call s:TintLink("WetBlue0", "htmlTagName")

" #### JSX        #########################################################
call s:TintLink("WetBold", "jsxTag")
call s:TintLink("WetBlue0", "jsxTagName")

" #### JSON       #########################################################
call s:TintLink("WetBlue0", "jsonKeyword")
call s:TintLink("WetDebug", "jsonQuote")
call s:TintLink("WetDebug", "jsonBraces")
call s:TintLink("WetBlue1", "jsonString")

" #### MARKDOWN   #########################################################
call s:TintLink('WetBlue1', 'markdownCode')

" #### GIT GUTTER #########################################################
call s:Tint('GitGutterAdd', s:color.wetempty, s:color.wetgray2, 'BOLD')
call s:Tint('GitGutterChange', s:color.wetempty, s:color.wetblue2, 'BOLD')
call s:Tint('GitGutterDelete', s:color.wetempty, s:color.wetwarn, 'BOLD')
call s:Tint('GitGutterChangeDelete', s:color.wetempty, s:color.wetwarn, 'BOLD')

" #### DIAGNOSTIC #########################################################
call s:Tint('DiagnosticHint', s:color.wetempty, s:color.wetgray2, 'BOLD')
call s:Tint('DiagnosticInfo', s:color.wetempty, s:color.wetgray2, 'BOLD')
call s:Tint('DiagnosticWarn', s:color.wetempty, s:color.wetwarn, 'BOLD')
call s:Tint('DiagnosticError', s:color.wetempty, s:color.weterror, 'BOLD')

call s:Tint('DiagnosticSignHint', s:color.wetblue0, s:color.wetblue0, 'BOLD')
call s:Tint('DiagnosticSignInfo', s:color.wetdebug, s:color.wetdebug, 'BOLD')
call s:Tint('DiagnosticSignWarn', s:color.wetwarn, s:color.wetwarn, 'BOLD')
call s:Tint('DiagnosticSignError', s:color.weterror, s:color.weterror, 'BOLD')
call s:Tint('LightBulbSign', s:color.wetempty, s:color.wetgray2, 'BOLD')

" #### TELESCOPE  #########################################################
call s:Tint('TelescopeNormal', s:color.wetblack, s:color.wetblue0, 'NONE')
call s:Tint('TelescopeTitle', s:color.wetempty, s:color.wetwhite, 'BOLD')
call s:Tint('TelescopeMultiSelection', s:color.wetempty, s:color.wetdebug, 'BOLD')

" call s:Tint('TelescopeResultsNormal', s:color.wetmenu, s:color.wetwhite, 'NONE')
call s:Tint('TelescopePromptNormal', s:color.wetblack, s:color.wetshell, 'NONE')
call s:Tint('TelescopePreviewNormal', s:color.wetblack, s:color.wetwhite, 'NONE')
call s:Tint('TelescopePreviewBorder', s:color.wetblack, s:color.wetblue0, 'NONE')
call s:Tint('TelescopeSelection', s:color.wetblue0, s:color.wetshell, 'NONE')
call s:Tint('TelescopeMatching', s:color.wetempty, s:color.wetdebug, 'NONE')

" call s:Tint('@variable', s:color.wetempty , s:color.w, 'NONE')
" call s:Tint('@module.builtin', s:color.wetempty , s:color.wetblue1, 'NONE')
" call s:Tint('@function.builtin', s:color.wetempty , s:color.wetblue1, 'UNDERLINE')
" call s:Tint('@function.call', s:color.wetempty , s:color.weterror, 'UNDERLINE')

" zig
call s:Tint('@property', s:color.wetempty , s:color.wetshell, 'NONE')
call s:Tint('@variable.member', s:color.wetempty , s:color.wetshell, 'NONE')
call s:Tint('function', s:color.wetempty , s:color.wetgray6, 'NONE')
call s:Tint('Type', s:color.wetempty , s:color.wetgreen1, 'NONE')
call s:Tint('variable', s:color.wetempty , s:color.wetshell, 'UNDERCURL')
call s:Tint('Structure', s:color.wetempty , s:color.wetgreen0, 'NONE')
call s:Tint('@lsp.type.variable', s:color.wetempty , s:color.wetshell, 'NONE')
call s:Tint('@lsp.type.namespace', s:color.wetempty , s:color.wetshell, 'NONE')
call s:Tint('Constant', s:color.wetempty , s:color.wetshell, 'NONE')

"hi whichkey
call s:Tint('WhichKeyGroup', s:color.wetempty, s:color.wetblue0, 'NONE')
call s:Tint('WhichKey', s:color.wetempty, s:color.wetblue0, 'NONE')
call s:Tint('WhichKeyDesc', s:color.wetempty, s:color.wetblue1, 'NONE')

call s:Tint('TodoBgTodo', s:color.wetempty, s:color.wetdebug, 'NONE')
call s:Tint('TodoFgTodo', s:color.wetempty, s:color.wetgray2, 'NONE')
call s:Tint('TodoBgNote', s:color.wetempty, s:color.wetdebug, 'NONE')
call s:Tint('TodoFgNote', s:color.wetempty, s:color.wetgray2, 'NONE')
call s:Tint('TodoBgFix', s:color.wetempty, s:color.weterror, 'NONE')
call s:Tint('TodoFgFix', s:color.wetempty, s:color.weterror, 'NONE')
call s:Tint('TodoBgWarn', s:color.wetempty, s:color.wetwarn, 'NONE')
call s:Tint('TodoFgWarn', s:color.wetempty, s:color.wetwarn, 'NONE')
call s:TintLink('TodoBgWarn', 'TodoBgPerf')
call s:TintLink('TodoFgWarn', 'TodoFgPerf')
call s:TintLink('TodoBgWarn', 'TodoBgHack')
call s:TintLink('TodoFgWarn', 'TodoFgHack')
call s:TintLink('TodoBgWarn', 'TodoBgPerf')
call s:TintLink('TodoFgWarn', 'TodoFgPerf')


" hi @variable.member guifg=#888888
hi link Operator WetBlue0
hi link @keyword.operator WetBlue0
" hi @variable.member guifg=#fff0f0
" hi Operator guifg=#885544
" hi @keyword.operator guifg=#885544
" hi Function guifg=#aaaaaa
" hi Function guifg=#aaaaaa
" hi Keyword guifg=#885544
hi Keyword guifg=#657474
" hi String guifg=#aa7777
" hi @constant.builtin guifg=#885544


" rose
" hi Operator guifg=#885544
" hi @keyword.operator guifg=#885544
" hi Function guifg=#aaaaaa
" hi Function guifg=#aaaaaa
" hi Keyword guifg=#885544
" hi String guifg=#aa7777

" gray
" hi Operator guifg=#badbad
" hi @keyword.operator guifg=#bce2b7
" hi Function guifg=#aaaaaa
" hi Keyword guifg=#888888
" hi String guifg=#7777aa
