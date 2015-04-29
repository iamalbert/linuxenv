syntax on



set incsearch
set hlsearch

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

set encoding=utf-8
set list
set listchars=tab:»\ ,trail:→

" exec
"   :PluginInstall 
" in vim or 
"   $ vim +PluginInstall +qall
" to install plugins
set nocompatible              " be iMproved, required
"filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"http://vim-scripts.org/vim/scripts.html

Plugin 'The-NERD-tree'
"Plugin 'desert256.vim'
"Plugin 'rdark-terminal'
"Plugin 'zenburn'
"Plugin 'Atom'

" Github
Plugin 'etaoins/vim-volt-syntax'
Plugin 'gkz/vim-ls'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'guns/xterm-color-table.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'

"Plugin 'itchyny/landscape.vim'
"Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
"Plugin 'w0ng/vim-hybrid'
"Plugin 'jonathanfilip/vim-lucius'
"Plugin 'sickill/vim-monokai'
"Plugin '29decibel/codeschool-vim-theme'
"Plugin 'sjl/badwolf'
"Plugin 'morhetz/gruvbox'
"Plugin 'jpo/vim-railscasts-theme'

call vundle#end()            " required
""filetype plugin off indent off    " required
set t_Co=256
"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm


map <F5> :NERDTree<CR>
map <F6> :NERDTreeClose<CR>

map <F7> :make<CR>
map <C-F7> :make clean all <CR>
map <F8> :make clean %<<CR>


noremap  <F9> :make %<<CR>

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

noremap  <C-S>         :update<CR>
vnoremap <C-S>         <C-C>:update<CR>
inoremap <C-S>         <C-C>:update<CR>

noremap  <C-Z>         u<CR>
vnoremap <C-Z>         <C-C>u<CR>
inoremap <C-Z>         <C-O>u<CR>

autocmd FileType make set noexpandtab
autocmd FileType python set sw=4 sts=4 ts=4 
autocmd BufEnter,BufNew *volt set filetype=volt

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1

noremap  <F10> :IndentGuidesToggle<CR>
vnoremap <F10> <C-C>:IndentGuidesToggle<CR>
inoremap <F10> <C-O>:IndentGuidesToggle<CR>

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=233
hi IndentGuidesEven ctermbg=232


colors jellybeans
set background=light

hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none

map <UP> <NOP>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>
map <INSERT> <NOP>
map <HOME> <NOP>
map <END> <NOP>
map <PAGEUP> <NOP>
map <PAGEDOWN> <NOP>

imap <UP> <NOP>
imap <DOWN> <NOP>
imap <LEFT> <NOP>
imap <RIGHT> <NOP>
imap <INSERT> <NOP>
imap <HOME> <NOP>
imap <END> <NOP>
imap <PAGEUP> <NOP>
imap <PAGEDOWN> <NOP>


set cursorline
set rnu
ino <C-C> <Esc>
autocmd InsertEnter * :set nu
autocmd InsertLeave * :set rnu


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
