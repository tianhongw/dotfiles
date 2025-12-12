# Dotfiles

![Screenshot](./images/screenshot_new.png)

My personal dotfiles for daily development environment.

## What does `install.sh` do?

1. Backup your existing config files to `~/dotfiles_old`
2. Symlink config files for `awesomewm`, `tmux`, `vim`, `urxvt`, and `zsh`

## Prerequisites

Before installation, make sure you have the following installed:

- [awesome](https://awesomewm.org/) - Window manager
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [vim](https://www.vim.org/) - Text editor
- [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html) - Terminal emulator
- [zsh](https://www.zsh.org/) - Shell

### Vim Plugin Manager

This config uses [Vundle](https://github.com/VundleVim/Vundle.vim) as the Vim plugin manager. The `install.sh` script will install it automatically if not present.

### Zsh Configuration

Set zsh as your default shell and install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh). The `install.sh` script will install it automatically if not present.

### Fonts

Install the required fonts:

```bash
# Arch Linux
sudo pacman -S ttf-font-awesome ttf-monaco adobe-source-han-sans-cn-fonts
```

Or configure `URxvt.font` in `Xresources` to use your preferred fonts.

### Application Launcher (Optional)

For the application launcher (shortcut: `M+r`), install [rofi](https://github.com/davatorium/rofi):

```bash
# Arch Linux
sudo pacman -S rofi
```

## Installation

```bash
git clone https://github.com/Trytwice/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Customization

### Wallpaper

Replace `~/.config/awesome/themes/powerarrow-dark/wall.png` with your preferred wallpaper.

### Music Widget

Requires [mpd](https://wiki.archlinux.org/title/Music_Player_Daemon) and `mpc`.

### Mail Widget

Configure `/themes/powerarrow-dark/theme.lua` to set up the mail widget.

> **Note**: If you're in China and using Gmail, you may need to configure a proxy. Edit the `head_command` variable in `/lain/widget/imap.lua` (e.g., using proxychains or polipo).

