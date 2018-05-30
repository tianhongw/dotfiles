#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files="config/awesome tmux.conf vimrc Xresources ycm_extra_conf.py zshrc"

if [ ! -d ~/.oh-my-zsh ]; then
    echo "You need install oh-my-zsh,see https://github.com/robbyrussell/oh-my-zsh"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

if [ ! -d ~/.vim/bundle ]; then
    echo "You need install Vundle, see git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cd $dir

echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
for file in $files; do
    if [ -d ~/.$file -o -f ~/.$file ]; then
        mv ~/.$file ~/dotfiles_old
    fi
    cp -r $file ~/.$file
done
vim +PluginInstall +qall
echo "All done, restart awesomewm(Win + Ctrl + r) and open new terminal to see what happend"

