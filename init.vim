if (has("termguicolors"))
	set termguicolors
endif

"------------------------------------------------------------------------------
                              " Plugin Management
"------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/conflict-marker.vim'
Plug 'purescript-contrib/purescript-vim'
Plug 'mhartington/oceanic-next'
Plug 'iCyMind/NeoSolarized'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' "Peer dependency of ranger
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" SML
Plug 'jez/vim-better-sml'

" JS/TS Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'

call plug#end()

"------------------------------------------------------------------------------
                              "Coc
"------------------------------------------------------------------------------

" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ "\<TAB>"

" Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor hold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Format code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType haskell setl formatexpr=CocAction('formatSelected')
augroup en

command! -nargs=0 Format :call CocAction('format')

" Status line
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"------------------------------------------------------------------------------
                              " Haskell
"------------------------------------------------------------------------------

let g:haskell_indent_do = 3
let g:haskell_indent_if = 3
let g:haskell_indent_in = 1
let g:haskell_indent_let = 4
let g:haskell_indent_case = 2
let g:haskell_indent_where = 6

au filetype haskell nnoremap <silent> <leader>l :let a='{-# LANGUAGE  #-}'\|put! = a <cr> l11 <Insert>
au filetype haskell nnoremap <silent> <leader>c 0<Insert>--<Space>

"------------------------------------------------------------------------------
                              " Javascript/Typescript
"------------------------------------------------------------------------------
au BufNewFile,BufRead *.ts setlocal filetype=typescript
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver']
autocmd FileType typescript :set makeprg=tsc
"

"------------------------------------------------------------------------------
                               " General
"------------------------------------------------------------------------------


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>


highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" Ranger
let g:ranger_replace_netrw = 1 "open ranger when vim open a directory

" Tab Stuff
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set      number
set      rnu
autocmd  BufWritePre * %s/\s\+$//e
set 	   nocompatible
set 	   backspace=indent,eol,start
filetype plugin indent on

" Theme
syntax      enable
set background=light

nnoremap <silent> <Leader>b :call ToggleBackground()<CR>
function! ToggleBackground()
    if &background == "light"
      let         g:oceanic_next_terminal_bold = 1
      let         g:oceanic_next_terminal_italic = 1
      colorscheme OceanicNext
      set background=dark
    else
      colorscheme solarized8_high
      let g:solarized_visibility = "high"
      set background=light
    endif
endfunction

call ToggleBackground()

" Mappings
nmap     td OTODO(jonathan): <ESC>gccA
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
