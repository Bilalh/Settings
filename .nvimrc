call plug#begin('~/.nvim/plugged')

" Make sure you use single quotes
Plug 'benekastah/neomake'
Plug 'vim-scripts/wombat256.vim'


" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplcache'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'mileszs/ack.vim'
Plug 'bling/vim-airline'

call plug#end()

" Syntax checking 
autocmd! BufWritePost * Neomake

" Color scheme
colorscheme wombat256mod

" Allow mouse use 
set mouse=a

" Don't show mode changes
set noshowmode

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Leader key timeout
set tm=2000
" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Kill the damned Ex mode.
nnoremap Q <nop>

" highlight the current line
set cursorline

" Line numbers
set number

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>"

" yank to sys board
vmap ,p "*y<CR>

" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Turn on the WiLd menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Always show the status line
set laststatus=2

" Use Cedilla ¸  as the trailing whitespace char
set listchars=tab:‣\ ,trail:¸ 
set list

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" jump to splits
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

noremap °;133 :tabprevious<cr>
noremap °;134 :tabnext<cr>


" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>

" Remember info about open buffers on close
set viminfo^=%

" jump to tag in new tab
noremap ,ct <C-w><C-]><C-w>T

"sane sys paste
set pastetoggle=<F2>


autocmd BufRead,BufNewFile *.py  set tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.rb  set noexpandtab tabstop=2 shiftwidth=2

" Fuzzy find files
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files=0

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f',
  \ }

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.sass-cache$|\.hg$\|\.svn$\|\.yardoc\|public$|log\|tmp$|smac*',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }


if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif



" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
