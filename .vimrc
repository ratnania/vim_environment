""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" enable number line
set number

" Enable filetype plugins
" filetype off
filetype indent on
filetype plugin on
filetype plugin indent on

" indentation for fortran
set expandtab
set shiftwidth=2
set softtabstop=2

" Set to auto read when a file is changed from the outside
set autoread

" automatically change to the current directory
"set autochdir " may not always work
autocmd BufEnter * silent! lcd %:p:h

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" disable swap files
set noswapfile

" haskell - comments
map ,- :s/^/-- /<CR>
" fotran - comments
map ,! :s/^/!/<CR>
" python - comments
map ," :s/^/#/<CR>
" c/c++ comments 
map ,/ :s/^/\/\//<CR>
" latex/matlab comments 
map ,% :s/^/%/<CR>
" sphinx comments 
map ,. :s/^/.. /<CR>
" cancel comment
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;.]//<CR>
" + blabla
" map ,+ :s/^/+ /<CR>
" - blabla
" map ,- :s/^/+ /<CR>

" using pathogen
" call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" call pathogen#helptags()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, theme, fonts ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme darkZ
" colorscheme desert
" colorscheme dejavu
" colorscheme autumnleaf 
" colorscheme autumn
colorscheme solarized

set background=dark
" set background=light
" enable syntax hyghlighting

set guifont=Monospace\ 11 
" Use the 16 colors terminal option to get VIM to look like GVIM with solarized colors. 
set t_Co=16

syntax on

" auto split line when len > 130
" set tw=130
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" 
" map <F2> :match ErrorMsg /%s/
" Then search for a pattern with the command / in Normal mode, or <Ctrl>o followed by / in Insert mode. * in Normal mode will search for the next occurrence of the word under the cursor. The hlsearch option will highlight all of them if set. # will search for the previous occurrence of the word.
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
" :nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
" replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" map Del to Escape
imap <del> <esc>
imap <M-q> <esc>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Latex-suite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor = 'latex'

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" By default, typing Alt-<key> in Vim takes focus to the menu bar if a menu with the hotkey <key> exists. If in your case, there are conflicts due to this behavior, you will need to set
set winaltkeys=no
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
" Set default width for NERDTree panel
let g:NERDTreeWinSize = 40
map <F3> :NERDTreeToggle<CR><CR>

" => CtrlP
set runtimepath+=$HOME/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'

" => easymotion
"set runtimepath+=$HOME/.vim/vim-easymotion

" => Enable OmniComppletion
"filetype plugin on
"set omnifunc=synthaxcomplete#Complete
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent !stty -ixon > /dev/null 2>/dev/null
