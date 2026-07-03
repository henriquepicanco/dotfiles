function install_nvim () {
    DOWNLOAD="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"
    TMP_PATH="/tmp/nvim"
    LOCAL_PATH="/usr/local/bin/nvim"

    curl -L ${DOWNLOAD} -o ${TMP_PATH}
    chmod +x ${TMP_PATH}
    sudo mv ${TMP_PATH} ${LOCAL_PATH}
}

alias install_nvim='install_nvim'

