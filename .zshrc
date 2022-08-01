# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bkallus/.zshrc'

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
alias xterm='st'
alias diff='diff --color'
alias mkdir='mkdir -p -v'
alias more='less'
alias dmesg='dmesg -HL'
alias less='less -R'
alias ip='ip -h -c=always'
alias 'pacman -S'='pacman -S --needed'
alias pgrep='pgrep --list-name'
alias sudo='doas'
alias objdump='objdump --visualize-jumps=extended-color'

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
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland

# Misc
export LC_ALL="en_US.UTF-8"
export XDG_CONFIG_HOME="/home/bkallus/.config"
export PATH=$PATH:/home/bkallus/.local/bin
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# For launching GUI programs
o() {
    "$@" &
    disown
    exit
}
