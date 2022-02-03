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
function! s:CreateGroup(group, bg, fg, term)
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

function! s:LinkGroup(left, right)
  execute join(['hi', 'clear', a:left], ' ')
  execute join(['hi', 'link', a:left, a:right], ' ')
endfunction

" DEFINE COLOR PALLET
let s:color = {}

" sky
let s:color.wetdark = [60, '#5F5F87']
let s:color.wetlight = [104, '#919bb1']
let s:color.websoft= [177, '#45848b']
let s:color.wetpale = [111, '#899cb0']

" earth
let s:color.error = [160, '#D70000']
let s:color.blush = [217, '#FFAFAF']
let s:color.shell = [230, '#FFFFD7']

" plant
let s:color.wetgrass  = [64, '#5F8700']
let s:color.wetalgee = [143, '#AFAF5F']

" greyscale
let s:color.offblack = [232, '#080808']
let s:color.hardgreyy = [235, '#262636']
let s:color.mediumgrey = [236, '#303040']
let s:color.softgrey = [240, '#585868']
let s:color.plalegrey = [245, '#8A8A9A']
let s:color.offwhite = [255, '#EEEEEE']
let s:color.purewhite = [231, '#FFFFFF']
let s:color.none = ['NONE', 'NONE']
