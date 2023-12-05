" vim:set ts=4 sts=2 sw=2 tw=0 ft=vim:

set nocompatible

filetype plugin indent off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
source $HOME/src/github.com/kozyty/dotfiles/bundles.vim

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" ファイル形式別のプラグインとインデントを有効にする
filetype indent plugin on

" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"<Leader>の設定
let mapleader = ","

" 日本語ヘルプフリーズ問題対策。
set notagbsearch

" ヘルプファイルの検索順
set helplang=ja,en

" バッファを切替えてもundoの効力を失わない
set hidden

" 起動時のメッセージを表示しない
set shortmess+=I

"スクロール時の余白
set scrolloff=5

" splitしたときに下に出す。
set splitbelow

" vsplitしたときに右に出す。
set splitright


"----------------------------------------------------
" エンコーディング
"----------------------------------------------------
" 文字コードの設定

" Vim内部で使われる文字エンコーディング
set encoding=utf-8

" ターミナルで使われるエンコーディング
set termencoding=utf-8

" カレントバッファのファイルの文字エンコーディング
set fileencoding=utf-8

" 読めなかったときに試される順番。
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,sjis

" 改行コードの自動認識
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする？
" powerline を使った時にステータスラインが更新されない場合があるのsingleで。
" if exists('&ambiwidth')
  " set ambiwidth=double
" endif


"----------------------------------------------------
" バックアップ・スワップ
"----------------------------------------------------
" バックアップをとらない
set nobackup

" ファイルの上書きの前にバックアップを作る
" (backup がオフの場合、バックアップは上書きに成功した後削除される)
set writebackup

" バックアップをとる
" set backup

" バックアップを作成しないファイルパターン
" set backupskip = escape(expand('$HOME'), '\') . '/tmp/*'

" バックアップ名の最後に文字列を追加
au BufWritePre * let &bex = '-' . strftime("%Y%m%d_%H%M")

" バックアップファイルを作るディレクトリ
if has('win32') || has('win64')
  set backupdir=$VIM/backup
else
  set backupdir=$HOME/backup
endif

" スワップファイルを作らない
set noswapfile

" スワップファイルを作るディレクトリ
if has('win32') || has('win64')
  set directory=$VIM/swap
else
  set directory=$HOME/swap
endif
" スワップファイルの更新間隔文字数
set updatecount=500


"----------------------------------------------------
" 環境別の設定・カラースキーマ
"----------------------------------------------------

if has('gui_running')
  " 入力時にマウスポインタを隠す (nomousehide:隠さない)
  set mousehide

  " GUIの設定。m:メニュー、r:右垂直バー、b:下のスクロールバー、l:左垂直バー
  " set guioptions=m
  set guioptions=

  if has('mac')
    "--------------------------------------------------
    " Mac用 gvim
    "--------------------------------------------------
    set guifont=Ricty\ 11

  elseif has('gui_gtk2')
    "--------------------------------------------------
    " Linux gvim
    "--------------------------------------------------

    " Font
    set guifont=Terminus-ja\ 11
    " set guifont=Migu\ 1M\ 11

  endif

else
  "--------------------------------------------------
  " CUI
  "--------------------------------------------------

  augroup au_initvim
    autocmd!
    " tabstop / shiftwidth
    autocmd! FileType vim,ruby,eruby,slim,php,javascript,html,zsh setlocal shiftwidth=2 tabstop=2
    " 保存時に行末の空白を除去する
    autocmd BufWritePre * :%s/\s\+$//ge
    " 256色表示
    autocmd Colorscheme * :set t_Co=256
    " 背景色でクリアする
    autocmd Colorscheme * :set t_ut=
    " specialkeyの色設定
    autocmd Colorscheme * :highlight SpecialKey ctermfg=238

    set lazyredraw
  augroup END
endif

"----------------------------------------------------
" 表示色関係

" 色のチェック方法
" :so $VIMRUNTIME/syntax/colortest.vim
"----------------------------------------------------

" 全角スペースの表示
"highlight ZenkakuSpace cterm=underline ctermfg=red guibg=red

" エラーと同じハイライトを適用。
highlight link ZenkakuSpace Error
autocmd BufRead,BufNew * match ZenkakuSpace /　/

hi LineNr     ctermfg=darkgreen ctermbg=darkgrey
hi Visual     ctermfg=white ctermbg=green
hi Search     ctermfg=white ctermbg=green
hi DiffAdd    ctermfg=226 ctermbg=235
hi DiffChange ctermfg=7 ctermbg=235
hi DiffDelete ctermfg=52 ctermbg=233
hi DiffText   cterm=none ctermfg=208 ctermbg=235
hi SpellBad   cterm=underline ctermfg=208 ctermbg=235
hi SpellLocal cterm=italic ctermfg=209 ctermbg=235
hi SpellRare  cterm=bold ctermfg=210 ctermbg=235

" ステータスラインの色 ctermfgがバックの色で、ctermbgがフロントの文字色
" highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
" highlight StatusLine term=reverse cterm=reverse ctermfg=blue ctermbg=white

" 入力モードの時にステータスラインの色を変える。
" let g:hi_insert = 'highlight StatusLine guifg=LightGrey guibg=darkblue gui=none ctermfg=white ctermbg=blue cterm=none'

" if has('syntax')
" augroup InsertHook
  " autocmd!
  " autocmd InsertEnter * call s:StatusLine('Enter')
  " autocmd InsertLeave * call s:StatusLine('Leave')
" augroup END
" endif

" let s:slhlcmd = ''
" function! s:StatusLine(mode)
  " if a:mode == 'Enter'
    " silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    " silent exec g:hi_insert
  " else
    " highlight clear StatusLine
    " silent exec s:slhlcmd
  " endif
" endfunction

" function! s:GetHighlight(hi)
  " redir => hl
  " exec 'highlight '.a:hi
  " redir END
  " let hl = substitute(hl, '[\r\n]', '', 'g')
  " let hl = substitute(hl, 'xxx', '', '')
  " return hl
" endfunction

" カーソルラインのハイライト。reverseで反転表示。
" highlight CursorLine term=reverse cterm=reverse

" カーソル列のハイライト。reverseで反転表示。
" highlight CursorColumn term=reverse cterm=reverse


"----------------------------------------------------
" 検索・補完
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100

" 検索の時に大文字小文字を区別しない
set ignorecase

" 検索altercation / solarized の時に大文字が含まれている場合は区別して検索する
set smartcase

" 最後altercation / solarized まで検索したら先頭に戻る
set wrapscan

" インクリメンタルサーチを使わない
"set noincsearch
set incsearch

" コマンドライン補完を拡張モードにする
set wildmenu

" 複数のマッチがあるときは、全てのマッチを羅列する。
set wildmode=full

" コマンドラインの補完キー
set wildchar=<Tab>

" 単語認識の境界文字を減らす
setlocal iskeyword+=-



"----------------------------------------------------
" 画面表示
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title

" 行番号を表示
set number

" ルーラーを表示
"set ruler

" タブ文字を CTRL-I（デフォルト） で表示し、行末に $ で表示する
set list
" タブ文字を次の文字列で視覚化(Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
" cが一文字で、xyが2文字。
" eol:c     行末の改行文字
" tab:c     タブ
" trail:xy  行末のスペース
" extends:c 折り返した行の表末
" precedes:c 折り返してきた表の行頭
" nbsp:c    ノンブレーカブルスペース（？）
set listchars=tab:>-,extends:<,trail:-

" 括弧入力時の対応する括弧を表示
set showmatch

" 対応する括弧の表示時間を2にする
set matchtime=2

" シンタックスハイライトを有効にする
syntax on

" 検索結果文字列のハイライトを有効にする
set hlsearch

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0

" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
"set wrap
set nowrap

" カーソルラインを表示させる
" set cursorline
" カーソル列を表示させる
" set cursorcolumn

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast


"----------------------------------------------------
" ステータスライン
"----------------------------------------------------
" 入力中のコマンドをステータスに表示する
set showcmd

" ステータスラインを常に表示
set laststatus=2

" ステータスラインの行数
set cmdheight=2

" ステータスラインに表示する情報の指定
" set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l行/%L行(%p%%),%v列>
" set statusline=%n\:%y%F\ %m%r%=%{fugitive#statusline()}[%{(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%l/%L(%p%%),%v]


"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
"set noautoindent

" タブが対応する空白の数
set tabstop=2

" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2

" インデントの各段階に使われる空白の数
set shiftwidth=2

" タブはハードタブとして入力する
" set noexpandtab
" タブは空白として入力する（実際にTABを入力したい場合は<C-V><TAB>）
set expandtab


"----------------------------------------------------
" オートコマンド関連
"----------------------------------------------------
" カーソル位置を記憶する
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
   \ endif

" javascript って打つのがめんどくさいので js にする
autocmd FileType js setlocal ft=javascript

" :vimgrep や :makeしたときに自動的にQuickFixを開く
au QuickfixCmdPost make,grep,grepadd,vimgrep copen


" 場所ごとに設定を用意する。
" 下の例では場所ごとのファイルは.vimrc_local
"
"   設定ファイルには例えば下記のようなことを書いておく。
"   カレントディレクトリを設定ファイルがある階層に移動
"   lcd <sfile>:h
"
augroup vimrc-local
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
    let files = findfile('.vimrc_local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction

" vimrcの一番最後でloaded_vimrcを1にしてる。
if exists('g:loaded_vimrc') && g:loaded_vimrc == 0
    call s:vimrc_local(getcwd())
endif


" php,ctpをバッファに追加したときにlcdする。
" autocmd BufAdd *.{php,ctp} execute "lcd " . expand("<afile>:p:h")

" vimで新しいファイルを作るとき、ディレクトリがなければ確認して作る。
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}


" ウィンドウを移動する度に外部で変更のあったファイルを自動的に読み直す
" 関連：autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END


"----------------------------------------------------
" keybindの設定
"
"   調べる方法。
"   :map
"
"   それぞれのモードだけ表示。
"   :nmap
"   :imap
"   :vmap
"
"   ショートカットキーの定義元ファイル情報も表示。
"   :verbose nmap
"
" |------------------|----------|----------|-----------|----------|
" | mode             | normal   | insert   | command   | visual   |
" |------------------|----------|----------|-----------|----------|
" | map / noremap    | yes      | no       | no        | yes      |
" | nmap / nnoremap  | yes      | no       | no        | no       |
" | imap / inoremap  | no       | yes      | no        | no       |
" | cmap / cnoremap  | no       | no       | yes       | no       |
" | vmap / vnoremap  | no       | no       | no        | yes      |
" | map! / noremap!  | no       | yes      | yes       | no       |
" |------------------|----------|----------|-----------|----------|



" <C-Space>を押すと<Nul>が送られるようなので。
map <Nul> <C-Space>
map! <Nul> <C-Space>

" ヘルプを引きやすくする
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>


" ----------
" バッファ系
" ----------
nnoremap <silent>bb :b#<CR>
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bd :bdelete<CR>

" 分割幅を広く
map <PageUp> 3<C-w>+
" 分割幅を狭く
map <PageDown> 3<C-w>-

" 分割ウィンドウに移動して大きくする
noremap <C-j> <C-w>j<C-w>_
noremap <C-k> <C-w>k<C-w>_

" Ctrl+Nで次のバッファを表示
" map <silent> <C-N> :bnext<CR>
" Ctrl+Pで前のバッファを表示
" map <silent> <C-P> :bprevious<CR>

" ----------
" 移動系
" ----------
" 移動量アップ
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" ----------
" 検索系
" ----------
" ハイライトを消す。
noremap <Esc><Esc> :<C-u>set nohlsearch<Return>

" 新しく別の単語を検索するときだけハイライトして、nやNでの移動はハイライトしたくない
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" ビジュアルモードで選択した範囲を検索
vnoremap z/ <ESC>/\%V
vnoremap z? <ESC>?\%V

" 検索時に/をエスケープ
cnoremap <expr>/ getcmdtype() == '/' ? '\/' : '/'


" ----------
" 編集系
" ----------
" インサートモードを抜ける
inoremap jj <Esc>

" 貼り付けの後「=」でフォーマッティングは面倒なので、いつでもカレント行のインデントにあわせた貼り付けをする。
nnoremap p ]p
nnoremap P ]P

" カーソル位置の単語を置換 s* と打鍵してから置き換え文字を打って /g エンターで発動。
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" レジスタやマークを確認しやすくする。
nnoremap <Space>m :<C-u>marks<Space>
nnoremap <Space>r :<C-u>registers<Space>


" 行末にセミコロンを追加する。
function! IsEndSemicolon()
  let c = getline(".")[col("$")-2]
  if c != ';'
    return 1
  else
    return 0
  endif
endfunction
" inoremap <expr>;; IsEndSemicolon() ? "<C-O>$;<CR>" : "<C-O>$<CR>"
inoremap <expr>;; IsEndSemicolon() ? "<C-O>$;" : "<C-O>$"
nnoremap <expr>;; IsEndSemicolon() ? "$a;<Esc>" : "$"

" vimスクリプト開発用に即バッファをsource。
" nnoremap <Leader>so :<C-u>source %<CR>

" ev / eg ですぐに.vimrcを開けるようにする。rv / rg で反映させる。
if has('gui_running')
  nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
  nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>
else
  nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
  nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>
endif

" カレントバッファのファイル名をヤンク
nnoremap <silent> <Leader>yf :<C-u>let @" = expand("%:t")<CR>:echo "yank: ". @"<CR>
" カレントバッファのフルパスをヤンク
nnoremap <silent> <Leader>yp :<C-u>let @" = expand("%:p")<CR>:echo "yank: ". @"<CR>

" 最後に編集したテキストを選択。
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>



"----------------------------------------------------
" 戦闘力を計測
"----------------------------------------------------
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
      \        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)



"----------------------------------------------------
" プラグインの設定
"----------------------------------------------------

"----------------------------------------------------
" showmarks.vim
"  <Leader>mt ON/OFFトグル。
"  <Leader>mm 次の使えるマークを使ってマーク。
"  <Leader>mh カレント行ののマークを削除。
"  <Leader>ma カレントバッファのマークを全部削除。
"----------------------------------------------------
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"help、quickfixと編集不可のバッファについて、マークを表示しない。-
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
"let showmarks_hlline_lower = 1
"let showmarks_hlline_upper = 1


"----------------------------------------------------
" NERD commenter
"----------------------------------------------------
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1
" /**/をスペース空けて/* */
let NERDSpaceDelims = 1

"----------------------------------------------------
" NERDTree
"----------------------------------------------------
" カラー表示するか
let NERDChristmasTree = 1
" 起動時に隠しファイルを表示するか（あとで切り替えられる）
let NERDTreeShowHidden = 1
" カーソル行を強調する場合1
let NERDTreeHighlightCursorline = 0
" NERDTreeウィンドウのサイズ
let NERDTreeWinSize = 40
" NERDTreeウィンドウを横に表示するか上に表示するか
let NERDTreeWinPos = "left"
" <F8>で開く/閉じる
nmap <silent> <F8> :NERDTreeToggle<CR>

let NERDTreeHijackNetrw = 0

" Auto centre
let NERDTreeAutoCenter = 0


"----------------------------------------------------
" neocomplcache.vim
"----------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


let g:neocomplcache_auto_completion_start_lengh = 3
let g:neocomplcache_max_list = 30

" Define dictionary.
if has('win32') || has('win64')
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions',
        \ 'php' : $VIM.'/vimfiles/dict/php.dict',
        \ }
else
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions',
        \ 'php' : $HOME.'/.vim/dict/php.dict',
        \ }
  " ユーザー定義スニペット保存ディレクトリ
  let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
endif


" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" undo
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 共通の部分まで補完
inoremap <expr><C-l>     neocomplcache#complete_common_string()


" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() ."\<CR>"
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" 補完を選択してポップアップを閉じる。
inoremap <expr><C-y>  neocomplcache#close_popup()
" 補完をキャンセルしてポップアップを閉じる
inoremap <expr><C-e>  neocomplcache#cancel_popup()


" 補完候補の一番先頭を選択しとく
let g:neocomplcache_enable_auto_select = 1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php,htmlcake set omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

" 言語別neocompl自動発火パターン
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'



" :NeoComplCacheEditSnippets [filetype]
" ユーザ定義用のスニペットファイルの編集ができる。
" ftを指定しなければ現在のftのスニペットファイルを開く。
" ちなみに、プラグインに組み込まれてるスニペットファイルは下記にある。
" ~/.vim/autoload/neocomplcache/sources/snippets_complete/
nnoremap <silent> <Space>es  :<C-u>NeoComplCacheEditSnippets

"----------------------------------------------------
" unite.vim
"----------------------------------------------------
nnoremap [unite] :<C-u>Unite<Space>
nmap f [unite]

nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]l :<C-u>Unite locate<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]n :<C-u>Unite n_class<CR>
nnoremap <silent> [unite]c :<C-u>Unite cake_controller  cake_model  cake_view  cake_shell  cake_component  cake_behavior  cake_lib  cake_fixture  cake_task  cake_core  cake_config  cake_helper -start-insert<CR>
nnoremap <silent> [unite]a :<C-u>Unite buffer file_mru -start-insert<CR>
set runtimepath+=~/.vim/plugin/

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup'
  let g:unite_source_grep_recursive_opt = ''
" let g:unite_source_grep_max_candidates = 200
  nnoremap [unite]g   :<C-u>Unite -no-quit grep<CR>
  nnoremap [unite]G   :<C-u>Unite -no-quit grep<CR><CR><C-r><C-w><CR>
else
  nnoremap [unite]g   :<C-u>Unite -no-quit grep<CR>
endif

"----------------------------------------------------
" ref.vim
"----------------------------------------------------
if has('win32') || has('win64')
  let g:ref_phpmanual_path = $VIM . '/vimfiles/manual/php_manual_ja/'
else
  let g:ref_phpmanual_path = $HOME . '/.vim/manual/php_manual_ja/'
endif

" PHP マニュアルを音速で引く
nnoremap [unite]r :<C-u>Unite ref/phpmanual -start-insert<CR>

" ftと辞書のマッピング
let g:ref_detect_filetype = {
      \ 'htmlcake' : 'phpmanual'
      \ }
"----------------------------------------------------
" scratch.vim
"----------------------------------------------------
nmap <silent> <F5> <Plug>ShowScratchBuffer
imap <silent> <F5> <Plug>InsShowScratchBuffer

" スクラッチバッファを開くマッピングを定義しない
let no_plugin_maps = 1

" vim終了時にスクラッチの内容を保存しておく。
let g:scratchBackupFile=$HOME . "/scratch.txt"


"----------------------------------------------------
" zencoding.vim
"----------------------------------------------------
" デフォルトは<C-Y>
let g:user_zen_leader_key = '<C-y>'

" 挿入モードで実行
let g:user_zen_expandabbr_key = '<C-y>'

" タグやスニペットの入力補完を使う
let g:use_zen_complete_tag = 1

" user_zen_leader_key -> カンマで展開ではなく、一発で展開する。
" let g:user_zen_expandabbr_key = '<C-Z>'

" filterについて -> http://code.google.com/p/zen-coding/wiki/Filters
let g:user_zen_settings = {
      \ 'lang' : 'ja',
      \ 'indentation' : '  ',
      \ 'html' : {
      \   'filters' : 'html,c',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'filters' : 'html',
      \ },
      \ 'ctp' : {
      \   'filters' : 'html',
      \ },
      \ 'htmlcake' : {
      \   'extends' : 'html',
      \ },
      \ 'perl' : {
      \   'aliases' : {
      \     'req' : 'require '
      \   },
      \   'snippets' : {
      \     'use' : "use strict\nuse warnings\n\n",
      \     'warn' : "warn \"|\";",
      \   }
      \ }
      \}


"----------------------------------------------------
" cake.vim
"----------------------------------------------------
nnoremap <Space>cc :<C-u>Ccontroller
nnoremap <Space>cm :<C-u>Cmodel
nnoremap <Space>cv :<C-u>Cview
nnoremap <Space>cl :<C-u>Clog
nnoremap <Space>ccv :<C-u>Ccontrollerview
nnoremap <Space>ccm :<C-u>Ccomponent
nnoremap <Space>ccf :<C-u>Cconfig
nnoremap <Space>cb :<C-u>Cbehavior
nnoremap <Space>ch :<C-u>Chelper
nnoremap <Space>ct :<C-u>Ctest
nnoremap <Space>cf :<C-u>Cfixture
nnoremap <Space>cs :<C-u>Cshell
nnoremap <Space>cd :<C-u>Cdesc

"----------------------------------------------------
" gist.vim
"----------------------------------------------------
let g:gist_privates = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_put_url_to_clipboard_after_post = 1


"----------------------------------------------------
" hatena.vim
"----------------------------------------------------
let g:hatena_user = 'kozyty'


"----------------------------------------------------
" PDV--phpDocumentor-for-Vim
"----------------------------------------------------
inoremap <Leader>d <ESC>:call PhpDocSingle()<CR>i
nnoremap <Leader>d :call PhpDocSingle()<CR>
vnoremap <Leader>d :call PhpDocRange()<CR>


"----------------------------------------------------
" surround.vim
"----------------------------------------------------
let g:surround_{char2nr("p")} = "<?php \r ?>"

"----------------------------------------------------
" srcexpl.vim
"----------------------------------------------------
" リフレッシュタイム(ms)
let g:SrcExpl_RefreshTime = 1000

let g:SrcExpl_winHeight = 8

let g:SrcExpl_searchLocalDef = 1

" マッピング

" 戻る機能のMAP(#ノーマルモードで動作する)
" let g:SrcExpl_GoBackMapKey = "<C-b>"
let g:SrcExpl_gobackKey = "<C-b>"
let g:SrcExpl_jumpKey = "<ENTER>"

" Source Explorerの機能ON/OFF(#普通にvimrcで書く方法と同じ)
nnoremap <F10> :SrcExplToggle<CR>

let g:SrcExpl_pluginList = [
      \ "__Tag_List__",
      \ "_NERD_tree_",
      \ "Source_Explorer"
      \ ]


"----------------------------------------------------
" powerline.vim
"----------------------------------------------------
if has('gui_running')
  let g:Powerline_symbols = 'fancy'
endif
" CUI環境下でいろ変更が遅れることがある対応
if has('unix') && !has('gui_running')
  inoremap <silent> <Esc> <Esc>
  inoremap <silent> <C-[> <Esc>
endif

"----------------------------------------------------
" easymotion.vim
"----------------------------------------------------
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key = "<Space>"
let g:EasyMotion_grouping = 1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

"----------------------------------------------------
" Modeliner
"----------------------------------------------------
let g:Modeliner_format='ft= et ff= fenc= sts= sw= ts='


"----------------------------------------------------
" ctrlp.vim
"----------------------------------------------------
let g:ctrlp_by_filename         = 1 " フルパスではなくファイル名のみで絞込み
let g:ctrlp_jump_to_buffer      = 2 " タブで開かれていた場合はそのタブに切り替える
let g:ctrlp_clear_cache_on_exit = 0 " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
" let g:ctrlp_highlight_match     = [1, 'IncSearch'] " 絞り込みで一致した部分のハイライト
let g:ctrlp_open_new_file       = 1 " 新規ファイル作成時にタブで開く
let g:ctrlp_open_multi          = '10t' " 複数ファイルを開く時にタブで最大10まで開く

let g:ctrlp_max_height = 30
" let g:ctrlp_max_height = &lines

"----------------------------------------------------
" ctrlp.vim
"----------------------------------------------------
set tags=tags

"----------------------------------------------------
" fholgado/minibufexpl.vim
"----------------------------------------------------
" let g:miniBufExplVSplit = 20
" let g:miniBufExplSplitBelow = 0
" let g:miniBufExplAutoOpen = 0
" map <Leader>t :TMiniBufExplorer<cr>

"----------------------------------------------------
" TweetVim
"----------------------------------------------------
let g:tweetvim_tweet_per_page = 100
let g:tweetvim_cache_size     = 10
let g:tweetvim_config_dir     = expand('~/.tweetvim')
let g:tweetvim_include_rts    = 1
let g:tweetvim_display_time   = 1

" タイムライン選択用の Unite を起動する
nnoremap <silent> t :Unite tweetvim<CR>
" 発言用バッファを表示する
nnoremap <silent> s           :<C-u>TweetVimSay<CR>
" mentions を表示する
nnoremap <silent> <Space>re   :<C-u>TweetVimMentions<CR>
" 特定のリストのタイムラインを表示する
" nnoremap <silent> <Space>tt   :<C-u>TweetVimListStatuses sho vim<CR>

" スクリーン名のキャッシュを利用して、neocomplcache で補完する
if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists = {}
endif
let neco_dic = g:neocomplcache_dictionary_filetype_lists
let neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'

"----------------------------------------------------
" OpenBrowser
"----------------------------------------------------
nmap <Leader>w <Plug>(openbrowser-smart-search)


""----------------------------------------------------
""" neobundle.vim
""----------------------------------------------------
"set nocompatible
"filetype plugin indent off

"if has('vim_starting')
  "set runtimepath+=~/.vim/neobundle.vim/
  "call neobundle#rc(expand('~/.vim/bundle/'))
"endif

""NeoBundle 'Shougo/unite.vim'
""NeoBundle 'Shougo/vimproc'
""NeoBundle 'ujihisa/unite-locate'
""NeoBundle 'rails.vim'
"NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'violetyk/cake.vim'
"NeoBundle 'The-NERD-tree'
"NeoBundle 'The-NERD-Commenter'
"NeoBundle 'Gist.vim'
"NeoBundle 'jelera/vim-javascript-syntax'
"NeoBundle 'tpope/vim-surround'
"" Color Scheme
"NeoBundle 'altercation/vim-colors-solarized'

"filetype plugin indent on

"syntax on
"filetype on
"filetype indent on
"filetype plugin on

"let mapleader = ","
"set encoding=utf-8
"set termencoding=utf-8
"set fileencodings=utf-8,iso-2022-jp-3,cp932,euc-jisx0213,ucs-2
"set ambiwidth=double
"set imdisable
"set hlsearch
"set nobackup
"set expandtab
"set smartindent
"set shiftwidth=4
"set softtabstop=4
"set tabstop=4
"set nowrap
"set cmdheight=1
"set notitle
"set laststatus=2
"let skk_jisyo = '~/.skk-jisyo'
"let skk_large_jisyo = '/usr/share/skk/SKK-JISYO.L'
"let skk_auto_save_jisyo = 1
"let skk_keep_state = 0
"let skk_egg_like_newline = 1
"let skk_show_annotation = 1
"let skk_use_face = 1

"" 2html
"let html_use_css = 1
"let use_xhtml = 1
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd BufNewFile,BufRead *.ctp set filetype=php

"" rails.vim
"let g:rails_level=4
"let g:rails_default_file="app/controllers/application.rb"
"let g:rails_default_database="sqlite3"
"let g:rubycomplete_buffer_loading = 1
"let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1

"" rubycomplete.vim
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby set sw=2 sts=2 ts=2
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"" howm
"let howm_dir = '~/howm'
"let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
"let howm_fileencoding = 'utf-8'
"let howm_fileformat = 'unix'
"let mygrepprg = 'grep'
"let MyGrep_ShellEncoding = 'utf-8'

" vim-jsx-riot
au BufNewFile,BufRead *.tag setlocal ft=javascript

" precious " {{{
let g:precious_enable_switchers = {
      \ "*" : {
      \   "setfiletype" : 0
      \ },
      \ "markdown" : {
      \   "setfiletype" : 1
      \ },
      \}
" }}}

"" Tabs
nnoremap <D-t> :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <D-w> :<C-u>tabclose<CR>
nnoremap <D-}> :<C-u>tabnext<CR>
nnoremap <D-{> :<C-u>tabprevious<CR>
nnoremap <C-p> :<C-u>bp<CR>
nnoremap <C-n> :<C-u>bn<CR>

" cakevim
let g:cakephp_enable_auto_mode = 1

" Gisthub
let g:nogistub_url = "http://gist.nanapi.co.jp/"
let g:nogistub_open_browser_after_post = 1

" yanktmp.vim
map <silent> ty :call YanktmpYank()<CR>
map <silent> tp :call YanktmpPaste_p()<CR>
map <silent> tP :call YanktmpPaste_P()<CR>
let g:yanktmp_file = '/tmp/vimyanktmp'

" git
" let g:gitCurrentBranch = ''
" function! CurrentGitBranch()
" let cwd = getcwd()
" cd %:p:h
" let branch = matchlist(system('/opt/local/bin/git branch -a --no-color'), '¥v¥* (¥w*)¥r?¥n')
" execute 'cd ' . cwd
" if (len(branch))
" let g:gitCurrentBranch = '][git:' . branch[1] . ''
" else
" let g:gitCurrentBranch = ''
" endif
" return g:gitCurrentBranch
" endfunction
" autocmd BufEnter * :call CurrentGitBranch()
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

autocmd BufWritePost *.php,*.ctp,*.js,*.rb,*.css,*.scss,*.erb,*.haml,*.html :CheckSyntax

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
