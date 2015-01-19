syntax on


set nu

set incsearch
set hlsearch

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smartindent

set background=dark

set list
set listchars=tab:▸\ ,trail:.

" exec
"   :PluginInstall 
" in vim or 
"   $ vim +PluginInstall +qall
" to install plugins
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"http://vim-scripts.org/vim/scripts.html

Plugin 'The-NERD-tree'

" Github
Plugin 'etaoins/vim-volt-syntax'
Plugin 'gkz/vim-ls'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
colors torte


map <F5> :NERDTree<CR>
map <F6> :NERDTreeClose<CR>

map <F7> :LiveScriptCompile vert watch<CR>:wincmd l<CR>:set scrollbind<CR>:wincmd h<CR>:set scrollbind<CR>
map <F8> :LiveScriptCompile unwatch<CR>:q<CR>

map <F9> :source $HOME/.vimrc<CR>

noremap  <silent> <C-S>         :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

noremap  <silent> <C-Z>         u<CR>
vnoremap <silent> <C-Z>         <C-C>u<CR>
inoremap <silent> <C-Z>         <C-O>u<CR>

