set nocompatible  " Use Vim defaults

set backspace=indent,eol,start  " reasonable backspace in insert mode

set modelines=0   " Modelines are a security hazard

" Formatting
set expandtab   " Automatically expand tabs to spaces
set tabstop=2   " tab width
set shiftwidth=2  " wide, otherwise it's tabstop wide
set softtabstop=2   " Simulated tabstop of 4 by using spaces and tabs
set textwidth=78  " where to wrap lines
set fo=crq      " when to wrap lines
set autoindent  " set auto-indenting on

" Display
set ruler   " show the cursor position
set nowrap  " don't warp display
set cursorline " highlight current line

set laststatus=2
set encoding=utf-8

set showmatch   " show matching brackets
set showcmd   " show (partial) command in status line

"set wildmenu
set wildmode=list:longest,full

" Searching
set incsearch   " incremental search
set infercase   " handle case in a smart way in autocompletes
set ignorecase  " ignore case in search
set smartcase   " unless the search string contains uppercase
set hlsearch  " highlighted search

" Display whitespace characters nicely when using 'set list'
set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<

filetype plugin on    " enable filetype detection
filetype indent on    " enable language-depenent indentation

syntax enable
set background=dark
set t_Co=256
highlight clear SignColumn

highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

set number  " line numbers
set scrolloff=10 " 10 lines top and bottom before scrolling
set hidden
set nobackup
set noswapfile

set mouse=a

" Trigger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" big history
set history=10000

" KEY BINDINGS
" toggle line numbers w/ f3
noremap <F4> :set invnumber<CR>
inoremap <F4> <C-O>:set invnumber<CR>
nmap <F2> :NERDTreeToggle<Return>
nmap <F3> :NERDTreeFind<Return>

set pastetoggle=<F5>
" sane uparrow/downarrow with wrapped lines
nmap j gj
nmap k gk

" use leader f to open fzf, t for tags
nmap <Leader>f :Files<Return>
nmap <Leader>t :Tags<Return>
nmap <Leader>p :Prettier<Return>
nmap <Leader><Tab> :b#<Return>
nmap <Leader>g :Ag 
nmap <Leader>b :Buffers<Return>
nmap <Leader>` :TsuQuickFix<Return>

" disable ex mode
:map Q <Nop>

" split handling
" more natural split handling
set splitbelow
set splitright
" ctrl hjkl for split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>


" PLUGIN CONFIGS
" vim-plug stuff
call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Quramy/tsuquyomi'
Plug 'airblade/vim-gitgutter'
Plug 'danilo-augusto/vim-afterglow'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
call plug#end()


" afterglow options
let g:afterglow_blackout=0
colorscheme afterglow

"airline config
set noshowmode " since using airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_y = ''
let g:airline#extensions#branch#format = 1


" disable prettier quickfix auto
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.ts PrettierAsync


" fzf config
" use fd so that gitignore is used on filenames shown
let $FZF_DEFAULT_COMMAND='fd --type f'

" coc config for autocomplete
source /Users/jfunke/.vimcoc
let g:tsuquyomi_disable_quickfix = 1
