# universelles install
install() {
    local sudo="" pm
    [ "$(id -u)" -ne 0 ] && sudo="sudo"

    if   command -v apk     >/dev/null 2>&1; then pm="apk add --no-cache"
    elif command -v apt-get >/dev/null 2>&1; then $sudo apt-get update -qq && pm="apt-get install -y"
    elif command -v dnf     >/dev/null 2>&1; then pm="dnf install -y"
    elif command -v pacman  >/dev/null 2>&1; then pm="pacman -S --noconfirm --needed"
    elif command -v brew    >/dev/null 2>&1; then pm="brew install"; sudo=""
    elif command -v snap    >/dev/null 2>&1; then pm="snap install"; sudo=""
    else echo "No supported package manager" >&2; return 1
    fi

    echo "Installing $*"
    $sudo $pm "$@" || { echo "Failed: $*" >&2; return 1; }
}

# Change Directory to the linux mount of a win dir
if command -v wslpath >/dev/null 2>&1; then
    wcd() {
        [ -z "$1" ] && { echo "Usage: wcd '<windows-path>'" >&2; return 1; }
        cd "$(wslpath -u "$*")" || return 1
    }
fi

# Reruns the last command with sudo
#srd = sudo redo
srd() {
    local cmd
    cmd="sudo $(history -p '!!')"
    read -rp "$cmd"$'\n'"[Press Enter to confirm]"
    eval "$cmd"
}
