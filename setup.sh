#!/bin/zsh

cd ~/
mkdir swap backup tmp memo tags trash

cd -
DOT_FILES=(.git .vim .vimrc .screenrc .zshrc .ctags .gitignore .gitconfig .tmux.conf .tmux-powerlinerc)
for file in ${DOT_FILES[@]}
do
  ln -sf $(cd $(dirname $0) && pwd)/$file ~/$file
  echo "シンボリックリンクを貼りました: ~/$file"
done

git clone git@github.com:Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim  +NeoBundleInstall +q
