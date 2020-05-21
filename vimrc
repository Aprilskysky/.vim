" __  ____   __ __     _____ __  __ ____   ____
"|  \/  \ \ / / \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /   \ \ / / | || |\/| | |_) | |
"| |  | | | |     \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|      \_/  |___|_|  |_|_| \_\\____|

" Author: Aprilsky

" === Auto load for first time uses
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vim/vimrc
endif

if !has('gui_running')
    set t_Co=256
endif

"key map
let mapleader = " "
noremap <space> <nop>
noremap <leader>sp :set spell!<CR>
noremap <leader><CR> :set hlsearch!<CR>
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>
noremap <Up> :res +5<CR>
noremap <Down> :res -5<CR>
noremap <Right> :vertical res -5<CR>
noremap <Left> :vertical res +5<CR>
noremap <leader>wl :set splitright<CR>:vsplit<CR>
noremap <leader>wh :set nosplitright<CR>:vsplit<CR>
noremap <leader>wj :set splitbelow<CR>:split<CR>
noremap <leader>wk :set nosplitbelow<CR>:split<CR>
noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>q <C-w>q
noremap <leader>sv <C-w>t<C-w>H
noremap <leader>ss <C-w>t<C-w>K
noremap n nzz
noremap N Nzz
vnoremap Y "+y
nnoremap <leader>, :bp<CR>
nnoremap <leader>. :bn<CR>
noremap <c-j> 10j
noremap <c-k> 10k
" noremap <leader>r :source C:\Program Files (x86)\Vim\_vimrc<CR>
noremap <leader>r :source ~/.vim/vimrc<CR>


"some set 
syntax enable
syntax on
set foldmethod=syntax
set foldlevel=100
set listchars=tab:\|\ ,
" colorscheme snazzy
" highlight Comment gui=nocombine
highlight Comment gui=bold
" set guifont=courier_new:h18
set guifont=DejaVuSansMono\ 17
set encoding=utf-8
set fileencodings=utf-8 ",chinese,latin-1,gbk,gb18030,gk2312
set number
set relativenumber
set cursorline cursorcolumn
"highlight Cursorline cterm=NONE ctermbg=NONE ctermfg=NONE guibg=black guifg=NONE
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set ai!
set smartindent
set scrolloff=5
set backspace=indent,eol,start
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set hidden
autocmd GUIEnter * simalt ~x
set nobackup
set noundofile
set vb t_vb=
au GuiEnter * set t_vb=
"Resolve menu clutter
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"Solve the consle prompt message output garbled code
language messages zh_CN.utf-8


noremap <F5> :call Vheader()<CR>
func!    Vheader()
    call append(0, '/******************************************************************')
    call append(1, ' * Project Name  : ')
    call append(2, ' * Author        : Aprilsky')
    call append(3, ' * Email         : ')
    call append(4, ' * Create Time   : '.strftime("%Y-%m-%d %H:%M"))
    call append(5, ' * Filename      : '.expand("%:t"))
    call append(6, ' * Module Name   : ')
    call append(7, ' * Company       : ')
    call append(8, ' * Version       : ')
    call append(9, ' * Abstract      : ')
    call append(10, ' * CopyRirht(c) 2020 All rights reserved')
    call append(11, ' * ****************************************************************')
    call append(12, ' * Description   : ')
    call append(13, ' * ')
    call append(14, ' *****************************************************************/')
    call append(15,'`timescale 1ns/1ps')
endfunc

"note for verilog
:ab pa //-------------------------------------------------------------<enter>******    Define Parameter and Internal signals   ******<enter>-------------------------------------------------------------
:ab mc //-------------------------------------------------------------<enter>*******************    Main Code   *********************<enter>-------------------------------------------------------------
:ab nt //-------------------------------------------


"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR> 


"Plug install
call plug#begin('~/.vim/plugged')
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
call plug#end()

"snazzy
"let g:SnazzyTransparent = 1
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }

" lightline
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set noshowmode " turn off extra -- INSERT --
" let g:lightline = {
" \ 'colorscheme': 'darcula',
" \ }
let g:lightline.active = {
		    \ 'left': [ [ 'mode', 'paste','spell' ],
		    \           [ 'readonly', 'filename', 'modified' ],
            \            [ 'bufnum' ] ],
		    \ 'right': [ [ 'lineinfo' ],
		    \            [ 'percent' ],
		    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] 
\}

"bufferline
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#filename_modifier = ':t'
"let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#min_buffer_count = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

"nerdtree
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"verilog instance
" so C:\Program Files (x86)\Vim\vim82\plugin\vlog_inst_gen.vim
so ~/.vim/vlog_inst_gen.vim
let g:vlog_inst_gen_mode=1 

"ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectorys = ['~/.vim/ultisnips']

"NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
let g:NERDAltDelims_verilog = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1







































