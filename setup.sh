#!/bin/sh

DOT_FILES=( .vimrc .screenrc .zshrc)

for file in ${DOT_FILES[@]}
do
  ln -s ~/workspace/dotfiles/$file ~/$file
  echo "シンボリックリンクを貼りました: ~/$file"
done

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/neobundle.vim
