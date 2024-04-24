# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/${USER}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b "

bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
bindkey "\e[3~" delete-char

alias grep='grep --color' # Compatible with busybox, but doesn't do anything
alias ls='ls -F -C --color'
alias diff='diff --color' # Not compatible with busybox
alias mkdir='mkdir -p'
alias rmdir='rmdir -p --ignore-fail-on-non-empty'
alias ip='ip --color=always' # Not compatible with busybox
alias pgrep='pgrep -l'

alias objdump='objdump --visualize-jumps=extended-color'
alias ssh='TERM=xterm-256color ssh'
alias nmcli='nmcli --pretty'
alias rg='rg --no-ignore'
alias less='less -R'

alias vim='nvim'
alias vi='nvim'
alias more='less'
alias sudo='doas'

# Theming
export GTK_THEME="Adwaita:dark"
export QT_AUTO_SCREEN_SCALE_FACTOR="0"
export QT_QPA_PLATFORMTHEME="qt5ct"

# Defaults
export SHELL="zsh"
export EDITOR="nvim"
export PAGER="less"
export LESSHISTFILE="/dev/null"

# Wayland
export MOZ_ENABLE_WAYLAND="1"
export QT_QPA_PLATFORM="wayland"
export _JAVA_AWT_WM_NONREPARENTING="1"
export CLUTTER_BACKEND="wayland"
export XDG_CURRENT_DESKTOP="sway"
export XDG_SESSION_TYPE="wayland"
export GDK_BACKEND="wayland"

# Misc
export XDG_CONFIG_HOME="$HOME/.config"

case ":$PATH:" in
  *:$HOME/.local/bin:*);;
  *) export PATH="$PATH:$HOME/.local/bin";;
esac

# Zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# For execing without leaving behind a terminal window
o() {
    "$@" &
    disown
    exit
}

# For activating python venvs
activate() {
    source "$@/bin/activate"
}
