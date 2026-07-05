function github_link () {
    echo "https://github.com/${1}/${2}/releases/latest/download/${3}"
}

function install_nvim () {
    DOWNLOAD=$(github_link "neovim" "neovim" "nvim-linux-x86_64.appimage")
    #DOWNLOAD="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"
    TMP_PATH="/tmp/nvim"
    LOCAL_PATH="/usr/local/bin/nvim"

    curl -L ${DOWNLOAD} -o ${TMP_PATH}
    chmod +x ${TMP_PATH}
    sudo mv ${TMP_PATH} ${LOCAL_PATH}
}

function install_zellij () {
    DOWNLOAD=$(github_link "zellij-org" "zellij" "zellij-x86_64-unknown-linux-musl.tar.gz")
    #DOWNLOAD="https://github.com/zellij-org/zellij/releases/latest/download/zellij-no-web-aarch64-unknown-linux-musl.tar.gz"
    TMP_PATH="/tmp/zellij-no-web-aarch64-unknown-linux-musl.tar.gz"
    LOCAL_PATH="/usr/local/bin/zellij"

    curl -L ${DOWNLOAD} -o ${TMP_PATH}
    tar -xvf ${TMP_PATH} -C /tmp
    chmod +x ${TMP_PATH}
    sudo mv /tmp/zellij ${LOCAL_PATH}
}

alias install_nvim='install_nvim'
alias install_zellij='install_zellij'

