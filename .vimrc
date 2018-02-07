set nocompatible              " be iMproved, required
filetype off                  " required
"
" Vundle {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'sjl/badwolf'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'python-mode/python-mode'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'TaskList.vim'
Plugin 'zhou13/vim-easyescape'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-fugitive'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line
" }}}
"
" Powerline {{{
set rtp+=/usr/local/lib/python4.5/dist-packages/powerline/bindings/vim     "
"For some unknown reason even if the above rtp is enabled or not it works,
"even if the docs tells that is has to be enable but i dont know if there can
"be 2 rtp (the one from Vundle).

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" Layout
set laststatus=2        " Always display the statusline in all windows
set showtabline=2       " Always display the tabline, even if there is only one tab
set noshowmode          " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" }}}
"
" Colors {{{
syntax enable           " enable syntax processing
colorscheme badwolf
"set termguicolors
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif
" }}}
"
" Spaces & Tabs {{{
set tabstop=4		" 4 space tab
set expandtab 		" use spaces for tabs
set softtabstop=4 	" 4 space tab
set shiftwidth=4
set modelines=1
"filetype indent on
"filetype plugin on
"set autoindent
" }}}
"
" UI Layout {{{
set number
set relativenumber
set showcmd 		" show command in bottom bar
set nocursorline	" highlight current line
set wildmenu
set lazyredraw
set showmatch		" highlight matching paranthesis
set fillchars+=vert:┃
" }}}
" 
" Searching {{{
set ignorecase		" ignore case when searching
set incsearch		" search as characters are entered
set hlsearch		" highlight all matches
" }}}
"
" Folding {{{
" === folding ===
set foldmethod=indent       " fold based on indent level
set foldnestmax=10          " max 10 depth
set foldenable              " don't fold files by default on open
nnoremap <space> za         " space open/close folds
set foldlevelstart=10       " start with fold level of 1
" }}}
"
" Line Shortcuts {{{
nnoremap j gj               " move vertically by visual line
nnoremap k gk
nnoremap gV `[v`]
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :UltiSnipsEdit<CR>
nnoremap <F2> :vsplit ~/.vimrc<CR> 
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
"
" Gundo {{{
if has('python3')
        let g:gundo_prefer_python3 = 1  " anything else breaks on Ubuntu 16.04+
endif
" }}}
"
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>u :GundoToggle<CR>         " Toggle gundo
" nnoremap <leader>m :silent make\|redraw!\|cw<CR>
" nnoremap <leader>h :A<CR>
" nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>et :exec ":vsp ~/Documents/Journals/" . strftime('%d-%m-%y') . ".md"<CR>
" nnoremap <leader>ez :vsp ~/.zshrc<CR>
" nnoremap <leader>sv :source $MYVIMRC<CR>
" nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession 
nnoremap <leader>sn :exec ":mksession! ~/VimSessions/" . strftime('%d-%m-%y@%H:%M:%S') . ".vim"<CR>
nnoremap <leader>a :Ag 
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
" nnoremap <leader>1 :set number!<CR>
" nnoremap <leader>d :Make! 
" nnoremap <leader>r :TestFile<CR>
" nnoremap <leader>g :call RunGoFile()<CR>
" vnoremap <leader>y "+y
" }}}
"
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}
" 
" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'
" }}}
"
" AutoGroups {{{
augroup configgroup
" autocmd!
" autocmd VimEnter * highlight clear SignColumn
" autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
" autocmd BufEnter *.cls setlocal filetype=java
" autocmd BufEnter *.zsh-theme setlocal filetype=zsh
" autocmd BufEnter Makefile setlocal noexpandtab
" autocmd BufEnter *.sh setlocal tabstop=2
" autocmd BufEnter *.sh setlocal shiftwidth=2
" autocmd BufEnter *.sh setlocal softtabstop=2
" autocmd BufEnter *.py setlocal tabstop=4
" autocmd BufEnter *.md setlocal ft=markdown
" augroup END

augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END

" " }}}
"
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
"
" Python-Mode {{{
let g:pymode_python = 'python3'
let g:pymode = 1
"let g:pymode_folding = 1
" }}}
"
" UltiSnips {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"

" let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<Right>"
let g:UltiSnipsJumpBackwardTrigger="<Left>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
"
" Vim Markdown {{{
let g:vim_markdown_autowrite = 1        " Autowrite when following link
"let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_fenced_languages = ['python3=py']
let g:vim_markdown_toc_autofit = 1
"let g:vim_markdown_folding_style_pythonic = 1
"}}}
"
" Easy Escape {{{
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 400
cnoremap jk <ESC>
cnoremap kj <ESC>
"}}}
"
"vim:foldmethod=marker:foldlevel=0
set timeoutlen=1000 ttimeoutlen=10      "Eliminate delay in ESC
