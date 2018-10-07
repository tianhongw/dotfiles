![](./images/screenshot.png)
### Dotfiles
---
This repository hosts the dotfiles i use in my daily life.The script `install.sh` does two things:  
1. backup your config files(if exist) to `~/dotfiles_old`.
2. copy my config files for `awesomewm` & `tmux` & `vim` & `urxvt` & `zsh` to you.
### Before installation
---
- Before installation, `awesomewm` & `tmux` & `vim` & `rxvt-unicode` & `zsh` are supposed to be installed.
- Because i use **vundle** as the Vim plugin manager, you need to install [Vundle](https://github.com/VundleVim/Vundle.vim) and Vundle is an awesome plugin manager for Vim.(the `install.sh` will help you do this if you didn't)
- Set the default shell to **zsh** if it is not the current shell.You also need to install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for your zsh's configuration.(the `install.sh` will help you do this if you didn't)
- Theme uses font ![FontAwesome](https://fontawesome.com/), in archlinux you can run `sudo pacman -S ttf-font-awesome` to install it.
- Install `Source Code= Pro` & `WenQuanYi Zen Hei font`, or set `URxvt.font` in `Xresources` to what you want to use.
- The pkglist in the file is a list that lists packages installed in my computer, you can ignore it.
### Installation
---
```bash
git clone https://github.com/Trytwice/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
```
### Customization
---
- **WallPaper**:The system's wallpaper is `~/.config/awesome/themes/powerarrow-dark/wall.png`, delete it and move you new wallpaper here and rename it as `wall.png`.
- **Music widget**:To use the music widget, you need install **mpd** and **mpc**.Search [ArchWiKi](https://wiki.archlinux.org/index.php/Music_Player_Daemon) for more details.
- **Mail widget**:To use the mail widget, you need config the `/themes/powerarrow-dark/theme.lua`, If you are in china, mail widget will not work when the mail server is gmail,
edit the `head_command` variable in `/lain/widget/imap.lua` will fix this(proxychains, polipo, etc).

