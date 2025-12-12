#!/bin/bash
set -e

######################
# Dotfiles installer
# - Uses symlinks instead of copies
# - Backs up existing files with timestamps
######################

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

# Detect OS
OS="$(uname -s)"

# Files to link (macOS only needs these)
files="tmux.conf vimrc zshrc"
# Linux specific files
[[ "$OS" == "Linux" ]] && files="$files Xresources config/awesome"

backup_and_link() {
    local src="$DOTFILES_DIR/$1"
    local dest="$HOME/.$1"
    local dest_dir="$(dirname "$dest")"

    mkdir -p "$dest_dir"

    if [[ -e "$dest" || -L "$dest" ]]; then
        if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
            info "Already linked: .$1"
            return
        fi
        mkdir -p "$BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
        warn "Backed up: .$1"
    fi

    ln -s "$src" "$dest"
    info "Linked: .$1"
}

# Install oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
    info "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh plugins
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
    info "Installing zsh-autosuggestions..."
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
    info "Installing zsh-syntax-highlighting..."
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# Install vim-plug (not Vundle - matches vimrc)
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    info "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install TPM for tmux
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    info "Installing TPM..."
    git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Create vim undo directory
mkdir -p ~/.vim/undodir

# Create symlinks
info "Creating symlinks..."
for file in $files; do
    backup_and_link "$file"
done

# Load Xresources on Linux
if [[ "$OS" == "Linux" ]] && command -v xrdb &>/dev/null; then
    xrdb ~/.Xresources
fi

# Install vim plugins
info "Installing vim plugins..."
vim +PlugInstall +qall 2>/dev/null || warn "Run :PlugInstall manually in vim"

# Install tmux plugins
if [[ -x ~/.tmux/plugins/tpm/bin/install_plugins ]]; then
    info "Installing tmux plugins..."
    ~/.tmux/plugins/tpm/bin/install_plugins || true
fi

info "Done! Restart terminal or run: source ~/.zshrc"
[[ -d "$BACKUP_DIR" ]] && info "Backups: $BACKUP_DIR"

