"""" polyglot
" disable latex, since handled by vimtex
let g:polyglot_disabled = ['latex']

call plug#begin()

Plug 'wakatime/vim-wakatime'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-syntastic/syntastic'

Plug 'mattn/emmet-vim'

Plug 'lervag/vimtex'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-fugitive'

Plug 'vhda/verilog_systemverilog.vim'

Plug 'vim-scripts/nginx.vim'

Plug 'nelsyeung/twig.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'rhysd/vim-grammarous'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
filetype plugin indent on

set laststatus=2

set tabstop=4
set softtabstop=4 noexpandtab
set shiftwidth=0

syntax on

set relativenumber
set number

"""" airline configuration
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""" file search
nnoremap <C-p> :Files<CR>
set path+=**
set wildmenu
set wildignore+=*/.git/*
set wildignore+=*/node_modules/*
set wildignore+=*/vendor/*

"""" tag jumping
command! MakeTags !ctags -R .

"""" various costumization
set scrolloff=1
set sidescrolloff=5
set encoding=utf-8
set formatoptions+=j " remove comment leader when joining commented lines
set history=100
set tabpagemax=50
" Mapping for fixing file indentation automatically
nmap <F7> gg=G<C-o><C-o>
imap <F7> <Esc>gg=G<C-o><C-o>
" Autoclosing brackets and similar
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
inoremap (<CR> (<CR>)<up><Esc>o
" inoremap [ []<left>
inoremap [<CR> [<CR>]<up><Esc>o
" inoremap { {}<left>
inoremap {<CR> {<CR>}<up><Esc>o
" New line command
:nnoremap <NL> i<CR><ESC>

autocmd BufNewFile,BufRead *.shader set syntax=glsl

function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-n>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

highlight clear SignColumn

let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_quickfix_ignore_filters = [
	\'Underfull \\hbox (badness [0-9]*) in ',
	\'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in ',
	\'Package hyperref Warning: Token not allowed in a PDF string',
	\'Package typearea Warning: Bad type area settings!',
	\]

set ttymouse=sgr
set mouse=a

set background=dark

" grammarous
let g:grammarous#use_vim_spelllang = 0
let g:grammarous#enable_spell_check = 1

" coc-ltex
let g:coc_filetype_map = {'tex': 'latex'}
