let iCanHazNeoBundle=1
set nocompatible
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'w0rp/ale'
NeoBundle 'toranb/tmux-navigator'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'toranb/nerd-ack'
NeoBundle 'toranb/vim-ack'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'bling/vim-airline'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'dustinfarris/vim-htmlbars-inline-syntax'
NeoBundle 'digitaltoad/vim-pug'
NeoBundle 'posva/vim-vue'
NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build' : {
    \     'mac' : './install.py --tern-completer',
    \     'unix' : './install.py --tern-completer',
    \   }
    \ }
call neobundle#end()

if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif
NeoBundleCheck

" Ale Settings
let g:ale_lint_on_text_changed = "normal"
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'
hi ALESignColumnWithErrors ctermbg=235
hi ALESignColumnWithoutErrors ctermbg=235
hi ALEErrorSign ctermbg=235 ctermfg=160 cterm=bold
hi ALEWarningSign ctermbg=235 ctermfg=172 cterm=bold
hi ALEError ctermbg=160 ctermfg=NONE
hi ALEWarning ctermbg=172 ctermfg=NONE

filetype plugin on
filetype indent on
set t_Co=256

" Indenting Stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent


" Backups
set nobackup
set nowritebackup
set noswapfile

" Buffer Stuff
set hidden
set autoread

" Search
set ignorecase
set incsearch

" Misc
set undolevels=1000
set noerrorbells
set autowrite
set clipboard=unnamed
set backspace=indent,eol,start
set laststatus=2
set splitbelow
set splitright
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
set relativenumber
set number

syntax enable
set cursorline
let g:airline_theme='solarized'
let g:airline_left_sep=''                           " No separator as they seem to look funky
let g:airline_right_sep=''                          " No separator as they seem to look funky
let g:airline_section_x = ''                        " Do not list the filetype or virtualenv in the status line
let g:airline_section_y = '[R%04l,C%04v] [LEN=%L]'  " Replace file encoding and file format info with file position
let g:airline_section_z = ''                        " Do not show the default file position info
let g:solarized_termcolors = &t_Co
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = "<leader>j"

" CTRLP
let g:ctrlp_use_caching=0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_multiple_files = '1jr'
let g:ctrlp_max_files=0
let g:ctrlp_max_height = 25
let g:ctrlp_custom_ignore = '\v[\/](transpiled)|dist|tmp|bower_components|node_modules|(\.(swp|git|bak|pyc|DS_Store))$'

let mapleader=" "
nnoremap <Leader>ed <C-w><C-v><C-l>:e $MYVIMRC<CR>

nnoremap <Leader>ff :CtrlP<CR>
map <Leader>fb :CtrlPBuffer<CR>
map <Leader>d :NERDTreeToggle<CR>
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader><Leader> <c-^>
map <Leader>a :Ack!<space>
map <Leader>ca :ccl<CR>:lclose<CR>

" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

inoremap jk <ESC> " Exit Insert Mode

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Remove whitespace""
autocmd BufWritePre * %s/\s\+$//e

" Save Hack
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Change indentation
function! ChangeIndent(indentSize)
    execute "set tabstop=".escape(a:indentSize, ' ')
    execute "set shiftwidth=".escape(a:indentSize, ' ')
    echo 'Indent size changed to' a:indentSize
endfunction
nnoremap <Leader>ci4 :call ChangeIndent(4)<CR>
nnoremap <Leader>ci2 :call ChangeIndent(2)<CR>

" Custom Theming
" https://jonasjacek.github.io/colors/
hi CursorLine cterm=NONE ctermbg=235 ctermfg=NONE
hi LineNr ctermbg=235 ctermfg=245
hi CursorLineNr ctermbg=235 ctermfg=9 cterm=bold
" highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" Line Length Column
set colorcolumn=80,120
highlight ColorColumn ctermbg=235
