export ZSH=/home/bilbo991/.zsh
export TERM=xterm-256color
export EDITOR=/usr/bin/vim
export PAGER=most

PROMPT='%F{cyan}%B%c%b%f %0(?.%F{green}%B➜ %b%f.%F{red}%B➜ %b%f)'
RPROMPT='%F{red}%B[%n - %*]%b%f'

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt menu_complete

source /home/bilbo991/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/bilbo991/.zsh/zsh-sudo/sudo.plugin.zsh
source /home/bilbo991/.zsh/zsh-command-not-found/command-not-found.plugin.zsh
source /home/bilbo991/.zsh/zsh-autopair/autopair.zsh

# Use ls-colors for path completions
function _set-list-colors() {
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
	unfunction _set-list-colors
}
sched 0 _set-list-colors

# Aliases
alias ls="ls --color"
alias e="exit"
alias cl="clear"
alias emacs="emacs -nw"

alias wpc="feh --randomize --bg-scale ~/Pictures/Wallpapers/Muted/*"
alias play="feh --bg-scale ~/Pictures/Wallpapers/moviePaper.jpg && mpv"
alias ace="~/.i3/aceStream.sh"
alias startx="startx &> ~/.xLogFile"
alias volume="amixer -D pulse sset Master"

#tmux aliases
alias create="tmux -2 new -s"
alias join="tmux new-session -t"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"
