"----------------------------------------------------
"" NeoBundle関連
"----------------------------------------------------

" help
NeoBundle 'vim-jp/vimdoc-ja'

" utility
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'matchit.zip'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'ShowMarks'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/unite-nyancat'
NeoBundle 'scratch-utility'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'dbext.vim'
NeoBundle 'motemen/hatena-vim'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'akiyan/vim-textobj-php'
NeoBundle 'akiyan/vim-textobj-xml-attribute'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/Modeliner'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'SQLUtilities'
NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'taglist.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tomtom/checksyntax_vim'
NeoBundle 'tomtom/quickfixsigns_vim'
"NeoBundle 'sji/gundo.vim'
"NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle "rking/ag.vim"
NeoBundle "kozyty/ginger.vim"
NeoBundle "vim-scripts/yanktmp.vim"
NeoBundle "osyo-manga/vim-precious"
NeoBundle "Shougo/context_filetype.vim"
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim'

" violetyk
"NeoBundle 'violetyk/neco-php'
NeoBundle 'violetyk/cake.vim'
NeoBundle 'violetyk/gitquick.vim'
NeoBundle 'joonty/vdebug'

" framework
NeoBundle 'naberon/vim-cakehtml'

" unite source
NeoBundle 'unite-colorscheme'
NeoBundle 'unite-locate'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tacroe/unite-mark'

" colorscheme
NeoBundle 'desert.vim'
NeoBundle 'desert256.vim'
NeoBundle 'mrkn256.vim'
NeoBundle 'molokai'
NeoBundle 'Zenburn'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'wombat256.vim'
NeoBundle 'jpo/vim-railscasts-theme'

" syntax
NeoBundle 'jQuery'
NeoBundle 'JavaScript-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-haml'

" indent
NeoBundle 'pangloss/vim-javascript'

" client + curl
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/open-browser-github.vim'
NeoBundle 'trapd00r/irc.vim'
NeoBundle 'VimIRC.vim'

" Fetch
NeoBundleFetch 'erikw/tmux-powerline'

" Ruby
NeoBundle 'rhysd/vim-textobj-ruby'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rake'
NeoBundle 'slim-template/vim-slim.git'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'scrooloose/syntastic'

" TypeScript
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'clausreinke/typescript-tools'

" Riot
NeoBundle 'nicklasos/vim-jsx-riot'
NeoBundle 'taltoad/vim-jade'
