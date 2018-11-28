" --- Plug installation ---
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plugins
Plug 'junegunn/vim-plug'
" LSP
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
" Git
Plug 'tpope/vim-fugitive'             "git in vim
" Linting
Plug 'w0rp/ale'			              "syntax checking
Plug 'nvie/vim-flake8'                "syntax checking
Plug 'hynek/vim-python-pep8-indent'   "auto indent python
" Completion
Plug 'maralla/completor.vim'
Plug 'tpope/vim-surround'             "auto add brackets quotes ...
" Tests
Plug 'janko-m/vim-test'               "unit tests
" Puppet
Plug 'rodjek/vim-puppet'              "puppet syntax highlighting
Plug 'puppetlabs/puppet-syntax-vim'   "puppet syntax
" Buffers
Plug 'ap/vim-buftabline'		      "tab style buffer names
Plug 'troydm/easybuffer.vim'          "easy buffer switch
Plug 'simeji/winresizer'              "quick resize buffers
Plug 'vim-scripts/ZoomWin'            "quick zoom in buffer
" Misc
Plug 'tmhedberg/SimpylFold'           "easy folding
Plug 'scrooloose/nerdtree'		      "file explorer
Plug 'scrooloose/nerdcommenter'	      "easy comment
Plug 'tpope/vim-surround'             "easy surrounding
Plug 'gcmt/wildfire.vim'              "easy select
Plug 'ctrlpvim/ctrlp.vim'             "fuzzy finding
Plug 'christoomey/vim-tmux-navigator' "navigate between tmux and vim
" Style
Plug 'ryanoasis/vim-devicons'         "fancy icons in vim
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "fancy colors
call plug#end()


" --- General settings ---
set encoding=UTF-8
set backspace=indent,eol,start
set ruler               " 
set number              " show line numbers
set showcmd             " show command in bottom bar
set incsearch           " search as chararters are typed
set hlsearch            " highlight matches
set ignorecase
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

set tabstop=4           " number of visual spaces per TAB
set expandtab           " number of spaces in TAB when editing
set shiftwidth=4

set smartindent
set autoindent

set background=dark

set scrolloff=10        " always stay in the middle of the screen

set nocompatible              " be iMproved, required
filetype off                  " required

" folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=999     " 10 nested fold max
setlocal foldmethod=indent   " fold based on indent level
" tab to fold
noremap <tab> zc   
" shift-tab to unfold
noremap <s-tab> zo 
" /folding


" plugins config
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\.svn$','\.git$']
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

" completor shortcuts (tab, shift+tab, enter)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" /completor

" vim-test
"let test#python#runner = 'pipenv run nosetest'
let test#strategy = "vimterminal"
let g:test#preserve_screen = 1
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
" /vim-test

" switch between buffers
set hidden
" end of switch between buffers

" CtrlP
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|_cache\|branches\|tags\|nodejs\|build\|node_modules\|vendors\|coverage\|dist\.dev\|dist\.prod\|framework\|vendor$',
            \ 'file': '\.exe$\|\.so$\|\.dat\|\.jpg\|\.png$'
            \ }

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" /CtrlP

" cursorline
:hi CursorLine   cterm=NONE ctermbg=235
:hi CursorColumn cterm=NONE ctermbg=235

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" /cursorline

" marking long lines
set colorcolumn=80
:autocmd BufNewFile,BufRead test_*.py set colorcolumn=100
:autocmd BufNewFile,BufRead test_*.py set textwidth=99
highlight ColorColumn ctermbg=236
" /marking long lines


" statusline
set laststatus=2
set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&enc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
if version >= 700
    set cursorline
    highlight statusLine cterm=bold ctermfg=7 ctermbg=1
    au InsertLeave * highlight StatusLine cterm=bold ctermfg=7 ctermbg=1
    au InsertEnter * highlight StatusLine cterm=bold ctermfg=7 ctermbg=2
endif
" /statusline


" ale
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_python_pylint_change_directory = 0
let g:ale_pattern_options = {
            \'^.*.py$': {
            \    'ale_python_pylint_options' : "--rcfile ./pylintrc_api",
            \    'ale_python_mypy_options' : "--ignore-missing-imports",
            \    },
            \'^.*test_.*\.py$': {
            \    'ale_python_pylint_options' : "--rcfile ./pylintrc_tests",
            \    'ale_python_flake8_options' : "--max-line-length=100"
            \    },
            \}
let g:ale_linters = {'eruby': []}
let g:ale_linters = {'ruby': ['rubocop']}
" /ale

" LSP
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}
"let g:LanguageClient_serverCommands.python = ['pyls', '-v', '--log-file', '/tmp/pyls.log']
let g:LanguageClient_serverCommands.python = ['pyls']
" Map renaming in python
autocmd FileType python nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>
" /LSP

" bindings
let mapleader = " "
let g:mapleader = " "
" unsplit lines
" Ctrl + Shit + j
nnoremap <NL> i<CR><ESC>
" show easy buffer
" Space + b
nnoremap <leader>b :EasyBuffer<CR>
" switch cursorline between horizontal and vertical
" Space + c
nnoremap <leader>c :set cursorline! cursorcolumn!<CR>
" show file browser
" Space + f
nnoremap <leader>f :NERDTreeToggle<CR>
" next buffer
" Space + n
nnoremap <leader>n :bnext<CR>
" previous buffer
" Space + p
nnoremap <leader>p :bprev<CR>
" buffer delete
" Space + q
nnoremap <leader>q :bd<CR>
" redo
" Space + r
nnoremap <leader>r :redo<CR>
" undo
" Space + u
nnoremap <leader>u :undo<CR>
" open terminal
" Space + t
nnoremap <leader>t :term ++close bash -l<CR>
" zoom in buffer
" Space + z
nnoremap <leader>z :ZoomWin<CR>
" language client menu
" F5
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" /bindings

" disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" /disable arrows

" specific filetypes
au BufNewFile,BufRead *.conf set filetype=sh
au BufNewFile,BufRead *.env set filetype=sh
au BufNewFile,BufRead *.lib set filetype=sh
au BufNewFile,BufRead *.eyaml set filetype=yaml
au BufNewFile,BufRead *.pp set filetype=puppet
au BufNewFile,BufRead *.js set filetype=java
au BufNewFile,BufRead *.rb set filetype=ruby

au FileType py match BadWhitespace /\s\+$/
au FileType py set tabstop=4
au FileType py set softtabstop=4
au FileType py set shiftwidth=4
au FileType py set textwidth=79
au FileType py set expandtab
au FileType py set autoindent

au FileType *.yml setl sw=2 sts=2 ft=ansible
au FileType *.yaml setl sw=2 sts=2 ft=ansible
au FileType *.json setl sw=2 sts=2 ft=java
au FileType *.json.schema setl sw=2 sts=2 ft=java

au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set textwidth=79
au FileType python set expandtab
au FileType python set autoindent
au FileType python set fileformat=unix

au FileType sh set tabstop=4
au FileType sh set softtabstop=4
au FileType sh set shiftwidth=4
au FileType sh set textwidth=79
au FileType sh set expandtab
au FileType sh set autoindent
au FileType sh set fileformat=unix

au FileType pp set tabstop=2
au FileType pp set softtabstop=2
au FileType pp set shiftwidth=2
au FileType pp set textwidth=79
au FileType pp set expandtab
au FileType pp set autoindent
au FileType pp set fileformat=unix

au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set textwidth=79
au FileType ruby set expandtab
au FileType ruby set autoindent
au FileType ruby set fileformat=unix
" /specific filetypes

syntax enable
