#!/bin/bash
######################
# This script does two things:
#   1.backup your config file to ~/dotfiles_old.(if exist)
#   2.copy my config file for awesomewm & tmux & vim & urxvt & zsh to you.
######################

dir=~/dotfiles              #dotfiles directory
olddir=~/dotfiles_old       #old dotfiles backup directory
files="config/awesome tmux.conf vimrc Xresources zshrc"   #list of files

# check if oh-my-zsh is installed
if [ ! -d ~/.oh-my-zsh ]; then
    echo "You need install oh-my-zsh,see https://github.com/robbyrussell/oh-my-zsh"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# two awesome plugins for zsh
echo "Installing zsh-autosuggestions......................."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "Installing zsh-syntax-highlighting...................."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# check if Vundle is installed
if [ ! -d ~/.vim/bundle ]; then
    echo "You need install Vundle, see git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# change to the dotfiles directory
cd $dir

# backup old config files and copy my config files to you
echo -e "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
for file in $files; do
    if [ -d ~/.$file -o -f ~/.$file ]; then
        mv ~/.$file ~/dotfiles_old
    fi
    cp -r $file ~/.$file
done

vim +PluginInstall +qall    #run this to install plugins for vim according to vimrc
xrdb ~/.Xresources          #run this to make the .Xresources work without restart X.

echo -e "...........................\nAll done, restart awesomewm(Win + Ctrl + r) and open new terminal to see what happend"

