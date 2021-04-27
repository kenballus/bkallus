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

# Colors in ls and the greps
alias ls='ls --color=auto --human-readable'
alias grep='grep --color=auto'
alias vim='nvim'
alias vi='nvim'
alias xterm='st'
alias diff='diff --color'
alias mkdir='mkdir -p -v'
alias more='less'
alias dmesg='dmesg -HL'

export GTK_THEME="Adwaita:dark"
export EDITOR="/usr/bin/nvim"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR="0"
export SHELL="/usr/bin/zsh"
export PAGER="/usr/bin/less"
export BROWSER="/usr/bin/firefox"

export DEVKITPRO="/opt/devkitpro"
export DEVKITARM="/opt/devkitpro/devkitARM"
export DEVKITA64="/opt/devkitpro/devkitA64"
export DEVKITPPC="/opt/devkitpro/devkitPPC"

# locale stuff
export LC_ALL="en_US.UTF-8"

# for user-dirs.dirs
export XDG_CONFIG_HOME="/home/bkallus/.config"

# Colors and suggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
