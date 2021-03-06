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
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' "Peer dependency of ranger
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'arcticicestudio/nord-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Purescript
Plug 'purescript-contrib/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'

" SML
Plug 'jez/vim-better-sml'

" JS/TS Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

call plug#end()

"Color Theme
syntax      enable
colorscheme nord

" Airline Theme
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_z = '%3p%% %3l/%L:%3v'
set noshowmode
"
"------------------------------------------------------------------------------
                              "Coc
"------------------------------------------------------------------------------
"" Tab completion
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ "\<TAB>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" Documentation
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Highlight symbol under cursor hold
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Format code
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType haskell setl formatexpr=CocAction('formatSelected')
"augroup en

"command! -nargs=0 Format :call CocAction('format')

""Misc
"set updatetime=300
"set cmdheight=2
"set shortmess+=c
"set signcolumn=yes

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

autocmd FileType haskell setlocal commentstring=--\ %s

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

let mapleader = "\<Space>"

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Vim Tab Management
nnoremap <leader>h gT
nnoremap <leader>l gt
nnoremap <leader>tt :RangerNewTab<CR>

" Fuzzy Find
let g:fzg_buffers_jump = 1
nnoremap fzt :Lines<CR>
nnoremap fzb :BLines<CR>
nnoremap fzf :Files<CR>
nnoremap fzg :GFiles?<CR>

" Highlight 81st column
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


" Mappings
nmap     <leader>to ITODO(jonathan): <ESC>gcc4ea
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
