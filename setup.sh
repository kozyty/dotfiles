#!/bin/sh

cd ~/
mkdir swap backup tmp memo tags trash

cd ~/workspace/dotfiles
DOT_FILES=( .bashrc .vim .vimrc .screenrc .zshrc .ctags .gitignore .gitconfig)
for file in ${DOT_FILES[@]}
do
  ln -sf ~/workspace/dotfiles/$file ~/$file
  echo "シンボリックリンクを貼りました: ~/$file"
done

cd ~/.vim/manual
wget http://jp1.php.net/get/php_manual_ja.tar.gz/from/this/mirror -O php_manual_ja.tar.gz
tar xf php_manual_ja.tar.gz
mv php-chunked-xhtml php_manual_ja

cd ~/workspace/dotfiles/
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# vim -u ~/dotfiles/bundles.vim +BundleInstall +q
vim  +NeoBundleInstall +q
