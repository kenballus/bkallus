# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/$(whoami)/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b "

autoload -Uz take
autoload -Uz zmv

bindkey "\e[H"  beginning-of-line

alias ls='ls --color=always --classify -C'
alias grep='grep --color=auto'
alias vim='nvim'
alias vi='nvim'
alias diff='diff --color'
alias mkdir='mkdir -p -v'
alias more='less'
alias less='less -R'
alias ip='ip -h -c=always'
alias pgrep='pgrep --list-name'
alias sudo='doas'
alias objdump='objdump --visualize-jumps=extended-color'
alias ssh='TERM=xterm-256color ssh'
alias nmcli='nmcli --pretty'

# Theming
export GTK_THEME="Adwaita:dark"
export EDITOR="/usr/bin/nvim"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR="0"

# Defaults
export SHELL="/usr/bin/zsh"
export PAGER="/usr/bin/less"
export BROWSER="/usr/bin/firefox"
export LESSHISTFILE="/dev/null"

# Wayland
export MOZ_ENABLE_WAYLAND="1"
export QT_QPA_PLATFORM="wayland"
export _JAVA_AWT_WM_NONREPARENTING="1"
export SDL_VIDEODRIVER="wayland"
export CLUTTER_BACKEND="wayland"
export XDG_CURRENT_DESKTOP="sway"
export GDK_BACKEND="wayland"

# Misc
export LC_ALL="en_US.UTF-8"
export XDG_CONFIG_HOME="/home/$(whoami)/.config"
export PATH="$PATH:$HOME/.local/bin"
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export XDG_CONFIG_HOME="$HOME/config"

# Zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# For launching GUI programs
o() {
    "$@" &
    disown
    exit
}

# For activating python venvs
activate() {
    source "$@/bin/activate"
}

