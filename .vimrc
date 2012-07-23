"----------------------------------------------------
"" neobundle.vim
"----------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'ujihisa/unite-locate'
NeoBundle 'violetyk/cake.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'rails.vim'
NeoBundle 'Gist.vim'
NeoBundle 'jelera/vim-javascript-syntax'
" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'
filetype plugin indent on

syntax on
filetype on
filetype indent on
filetype plugin on

let mapleader = ","
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jp-3,cp932,euc-jisx0213,ucs-2
set ambiwidth=double
set imdisable
set hlsearch
set nobackup
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set nowrap
set cmdheight=1
set notitle
set laststatus=2
let skk_jisyo = '~/.skk-jisyo'
let skk_large_jisyo = '/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1

" 2html
let html_use_css = 1
let use_xhtml = 1
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd BufNewFile,BufRead *.ctp set filetype=php

" rails.vim
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="sqlite3"
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" rubycomplete.vim
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby set sw=2 sts=2 ts=2
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" howm
let howm_dir = '~/howm'
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
let howm_fileencoding = 'utf-8'
let howm_fileformat = 'unix'
let mygrepprg = 'grep'
let MyGrep_ShellEncoding = 'utf-8'

" Tabs
nnoremap <D-t> :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <D-w> :<C-u>tabclose<CR>
nnoremap <D-}> :<C-u>tabnext<CR>
nnoremap <D-{> :<C-u>tabprevious<CR>
nnoremap <C-p> :<C-u>bp<CR>
nnoremap <C-n> :<C-u>bn<CR>

" git
let g:gitCurrentBranch = ''
function! CurrentGitBranch()
let cwd = getcwd()
cd %:p:h
let branch = matchlist(system('/opt/local/bin/git branch -a --no-color'), '¥v¥* (¥w*)¥r?¥n')
execute 'cd ' . cwd
if (len(branch))
let g:gitCurrentBranch = '][git:' . branch[1] . ''
else
let g:gitCurrentBranch = ''
endif
return g:gitCurrentBranch
endfunction
autocmd BufEnter * :call CurrentGitBranch()
"set statusline=%<%n¥ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff}%{g:gitCurrentBranch}%{']'}%y¥ %f%=%l,%c%V%8P

augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

imap <C-a> <Home>
imap <C-e> <End>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-d> <Del>
imap <C-g> <Esc>
imap <C-k> <C-o>D
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <C-p> <Up>
cmap <C-n> <Down>
cmap <C-d> <Del>
cmap <C-g> <Esc>
