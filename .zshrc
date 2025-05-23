# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/${USER}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b "

bindkey -e
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
bindkey "\e[3~" delete-char

alias grep='grep --color' # Compatible with busybox, but doesn't do anything
alias ls='ls -F -C --color'
alias diff='diff --color' # Not compatible with busybox
alias mkdir='mkdir -p -v'
alias rmdir='rmdir -p --ignore-fail-on-non-empty'
alias ip='ip -h -c=always' # Not compatible with busybox

alias objdump='objdump -F --visualize-jumps=extended-color --disassembler-color=extended -Mintel'
alias ssh='TERM=xterm-256color ssh'
alias nmcli='nmcli --pretty'
alias rg='rg --no-ignore'
alias less='less -R'

alias vim='nvim'
alias vi='nvim'
alias more='less -R'
alias sudo='run0'
alias doas='run0'

# Theming
export GTK_THEME="Adwaita:dark"
export QT_AUTO_SCREEN_SCALE_FACTOR="0"
export QT_QPA_PLATFORMTHEME="qt5ct"

# Defaults
export SHELL="/usr/bin/zsh"
export EDITOR="/usr/bin/nvim"
export PAGER="/usr/bin/less"
export LESSHISTFILE="/dev/null"
export BROWSER="$(which librewolf 2>/dev/null || which firefox 2>/dev/null)"

# Wayland
export MOZ_ENABLE_WAYLAND="1"
export QT_QPA_PLATFORM="wayland"
export _JAVA_AWT_WM_NONREPARENTING="1"
export CLUTTER_BACKEND="wayland"
export XDG_CURRENT_DESKTOP="sway"
export XDG_SESSION_TYPE="wayland"
export GDK_BACKEND="wayland"
export ELECTRON_OZONE_PLATFORM_HINT="auto"

# Misc
export XDG_CONFIG_HOME="$HOME/.config"

case ":$PATH:" in
  *:$HOME/.local/bin:*);;
  *) export PATH="$PATH:$HOME/.local/bin";;
esac

# Zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null || source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Debuginfod
export DEBUGINFOD_URLS="$({ stat /etc/arch-release &>/dev/null && printf '%s' 'https://debuginfod.archlinux.org' } \
                       || { stat /etc/fedora-release &>/dev/null && printf '%s' 'https://debuginfod.fedoraproject.org' } \
                       || { stat /etc/debian_version &>/dev/null && printf '%s' 'https://debuginfod.debian.net' })"

# For execing without leaving behind a terminal window
o() {
    "$@" &
    disown
    exit
}

retry() {
    while true; do
        "$@" && break;
        echo "Retrying..."
    done
}

# For activating python venvs
venv() {
    [ -z "$1" ] && VENVNAME=venv || VENVNAME="$1"
    [ -d "$VENVNAME" ] || python3 -m venv "$VENVNAME"
    source "$VENVNAME/bin/activate"
    rehash
}
