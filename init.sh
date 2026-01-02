#!/bin/bash
set -e  # Exit on any error

# Detect operating system
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"
    else
        echo "unknown"
        exit 1
    fi
}

OS=$(detect_os)
echo "Detected OS: $OS"

# Symlink configuration file
ln -sf ~/tmux/.tmux.conf ~/.tmux.conf

# Verify copyq is installed (required for clipboard integration)
if ! command -v copyq &> /dev/null; then
    echo ""
    echo "ERROR: copyq not found!"
    echo "Please install copyq first by running:"
    echo "  cd ~/unix-utils && ./install.sh"
    echo ""
    exit 1
fi

# Update package manager
if [[ "$OS" == "macos" ]]; then
    :  # brew update not needed for tmux installation
elif [[ "$OS" == "linux" ]]; then
    sudo apt-get update
fi

# Install software-properties-common (Linux only)
if [[ "$OS" == "linux" ]]; then
    sudo apt-get install -y software-properties-common
fi

# Install tmux
if [[ "$OS" == "macos" ]]; then
    brew install tmux
elif [[ "$OS" == "linux" ]]; then
    sudo apt-get install -y tmux
fi

# Install powerline fonts
if [[ "$OS" == "macos" ]]; then
    if [[ ! -d "/tmp/powerline-fonts" ]]; then
        git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline-fonts
        cd /tmp/powerline-fonts
        ./install.sh
        cd - > /dev/null
        rm -rf /tmp/powerline-fonts
    fi
elif [[ "$OS" == "linux" ]]; then
    sudo apt-get install -y fonts-powerline
fi

# Install tmux plugin manager
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Start tmux server and source config
tmux start-server 2>/dev/null || true
tmux source ~/.tmux.conf 2>/dev/null || true

# Install plugins (even though disabled in config)
if [[ -f "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]]; then
    ~/.tmux/plugins/tpm/bin/install_plugins
fi

echo ""
echo "Done!"
