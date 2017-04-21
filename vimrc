scriptencoding utf-8
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8
syntax on


set incsearch
set hlsearch

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent

set listchars=tab:▸\ ,eol:$

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
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'gregsexton/MatchTag'
Plugin 'leafo/moonscript-vim'
Plugin 'vim-jp/vim-java'
Plugin 'tomasiser/vim-code-dark'
Plugin 'ehamberg/vim-cute-python'


call vundle#end()            " required
""filetype plugin off indent off    " required
set t_Co=256
set t_ut=
"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm


map <F5> :TagbarToggle<CR>
map <F6> :NERDTreeToggle <CR>


set foldmethod=syntax
set nofoldenable

noremap  <F9> :make %<<CR>

noremap <F12> :set wrap!<CR>

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

noremap  <C-S>         :update<CR>
vnoremap <C-S>         <C-C>:update<CR>
inoremap <C-S>         <C-C>:update<CR>

noremap  <C-Z>         u<CR>
vnoremap <C-Z>         <C-C>u<CR>
inoremap <C-Z>         <C-O>u<CR>

autocmd FileType make set noexpandtab
autocmd BufEnter,BufNew *.tsv set noexpandtab
autocmd FileType c set cindent foldmethod=syntax 
autocmd FileType cpp set cindent foldmethod=syntax
autocmd FileType python set sw=4 sts=4 ts=4 
autocmd BufEnter,BufNew *volt set filetype=volt
autocmd BufEnter,BufNew *.scala set filetype=scala
autocmd BufEnter,BufNew *.gy set filetype=groovy
autocmd BufEnter,BufNew *.blade.php set filetype=blade

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=233
"hi IndentGuidesEven ctermbg=232

noremap  <F10> :set list!<CR>
vnoremap <F10> <C-C>:set list!<CR>
inoremap <F10> <C-O>:set list!<CR>


nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

.
"let g:jedi#popup_on_dot = 1
"let g:jedi#auto_initialization = 1
"let g:jedi#completions_command = "<C-Q>"

set background=dark
colors jellybeans

"hi Normal ctermbg=none
"hi NonText ctermbg=none
"hi LineNr ctermbg=none

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

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>


set rnu
ino <C-C> <Esc>
autocmd InsertEnter * :set nu
autocmd InsertLeave * :set rnu


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"set cursorline
"中文字測試
"hi CursorLine ctermbg=235 

"hi NonText ctermfg=7 guifg=gray ctermbg=none
set mouse=a
