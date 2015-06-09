set nocompatible
set t_Co=256
set mouse=a

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" syntax enable
colorscheme solarized
set background=dark
let g:solarized_termcolors=256

if has("autocmd")
	filetype on
	filetype indent on
	filetype plugin on
	autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
"	autocmd BufWritePre *.css,*.html,*.json,*.md,*.php,*.py,*.rb,*.scss,*.sh,*.txt :call StripTrailingWhitespace()
"	autocmd BufRead,BufNewFile *.json set filetype=json
endif

if has("cmdline_info")
	" Show the cursor line and column number
	set ruler
	" Show partial commands in status line
	set showcmd
	" Show whether in insert or replace mode
	set showmode
endif

if has('statusline')
	    " Always show status line
	    set laststatus=2
	    " Broken down into easily includeable segments
	    " Filename
	    set statusline=%<%f
	    " Options
	    set statusline+=%w%h%m%r
	    " Current dir
	   "set statusline+=\ [%{getcwd()}]
	    " Right aligned file nav info set
	    set statusline+=%=%-14.(%l,%c%V%)\%p%%
endif

if has("wildmenu")
	" Show a list of possible completions
	set wildmenu
	" Tab autocomplete longest possible part of a string, then list
	set wildmode=longest,list
	if has ("wildignore")
		set wildignore+=*.a,*.pyc,*.o,*.orig
		set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
		set wildignore+=.DS_Store,.git,.hg,.svn
		set wildignore+=*~,*.sw?,*.tmp
	endif
endif

if has("extra_search")
	" Highlight searches [use :noh to clear]
	set hlsearch
	" Highlight dynamically as pattern is typed
	set incsearch
	" Ignore case of searches...
	set ignorecase
	" ...unless has mixed case
	set smartcase
endif



set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'moll/vim-node'
  Plugin 'wookiehangover/jshint.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'wavded/vim-stylus'
  Plugin 'scrooloose/syntastic'
  Plugin 'mustache/vim-mode'
  Plugin 'millermedeiros/vim-esformatter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'ctrlp.vim'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'maksimr/vim-jsbeautify'
  Plugin 'einars/js-beautify'
  Plugin 'Chiel92/vim-autoformat'
  Plugin 'mxw/vim-jsx'

call vundle#end()
" Auto complete JS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS 

" Solarized

"show hidden files when using ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = '\v[\/](.project|.idea|.sass-cache|bower_components|node_modules|target|dist)|(\.(swp|ico|git|svn))$'

let g:ctrlp_max_files=0
" optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" No line wrapping
set nowrap
" Use 2 spaces for indentation
set shiftwidth=4
" Use 2 spaces for soft tab
set softtabstop=4
" Use 2 spaces for tab
set tabstop=4
" Expand tab to spaces
set expandtab
" Enable line numbers
set number
" Highlight current line
set cursorline
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show 'invisible' characters
" set list
" set autoindent
" set smartindent

" Set characters used to indicate 'invisible' characters
" set listchars=tab:▸\
" set listchars+=trail:·
" set listchars+=nbsp:_

" Centralize backups, swapfiles and undo history

set undofile
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
set undodir=$HOME/.vim/undo
set viminfo+=n$HOME/.vim/.viminfo
" Strip trailing whitespace (,$)
" noremap <leader>$ :call StripTrailingWhitespace()<CR>
" Faster viewport scrolling (3 lines at a time)

" nnoremap <C-e> 3<C-e>
" nnoremap <C-y> 3<C-y>
" vnoremap <C-e> 3<C-e>
" vnoremap <C-y> 3<C-y>
" Make `Y` work from the cursor to the end of line (which is more logical)
" nnoremap Y y$

" Load local machine settings if they exist
if filereadable(glob("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" jscs returns exit code when no config file is present.
" Only load it when appropriate.
function! JavascriptCheckers()
  if filereadable(getcwd() . '/.jscsrc')
    return ['jshint', 'jscs']
  else
    return ['jshint']
  endif
endfunction

autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs'] : ['jshint']

" --- autocomplete / supertab / jscomplete ---
set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d
" see [autocommands] at the end for more autocomplete settings

" nodejs-complete / jscomplete
let g:node_usejscomplete = 1
let g:jscomplete_use = ['dom', 'moz']

" let g:SuperTabMappingForward = '<c-space>'
" let g:SuperTabMappingBackward = '<s-c-Space>'
let g:SuperTabLongestEnhanced = 1
" let g:SuperTabDefaultCompletionType = "<c-p>"

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,javascript,python,perl6' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }


" NERD TREE
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeChDirMode=2
let MRU_Max_Entries=20
let MRU_Max_Menu_Entries=10
" let NERDTreeShowBookmarks=1

function! rc:isNTOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! rc:syncTree()
    if &modifiable && rc:isNTOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
    endif
endfunction
 " Keep sync current open file with NERDTree selected file.
autocmd BufEnter * call rc:syncTree()

" EASY MOTION
map <Leader> <Plug>(easymotion-prefix)

inoremap {<CR> {<CR>}<Esc>O<BS><Tab>}

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" DelimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" Autoformatter
noremap <F3> :Autoformat<CR><CR>

map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

if has('gui_running')
 set shortmess=atI       " Don't show the intro message at start and truncate msgs (avoid press ENTER msgs)."
endif

" React Sintax
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Quick exit
map Q :qa!<CR>
map q :q!<CR>
" Shift + zz # Is like to do: wq!

" Update file
nnoremap , :update!<CR>

" Clean highlight
map 1 :noh

" Copy Paste with xsel - F12 
map <F12> :r! xsel<CR><Esc>
