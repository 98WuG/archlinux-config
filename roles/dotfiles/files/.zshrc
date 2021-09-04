# Lines configured by zsh-newuser-install
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

# End of lines added by compinstall

# Source global profile
emulate sh -c 'source /etc/profile'

# Environment variables
export GOPATH=$HOME/go
export PATH=$PATH:/usr/lib/ccache/bin:$HOME/Scripts:$GOPATH/bin
export DOCKER_HOST="unix:///run/user/$(id -u)/podman/podman.sock"
export BAT_THEME="Nord"

# Partial line character
export PROMPT_EOL_MARK=""

# Handle SSH connection
if [[ -n $SSH_CONNECTION ]]; then
	export TERM='xterm-256color'
fi

# Disable beeping
setopt no_beep
setopt extendedglob

# Remap EDITOR to vim
export VISUAL=vim
export EDITOR=$VISUAL

# Allow background jobs to run after terminal closes
setopt NO_HUP
setopt NO_CHECK_JOBS

# ctrl+w stops at certain delimeters
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ffsend config
export FFSEND_HOST="https://send.geraldwu.com"

# Automatically escape special chars in URL
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Appends every command to the history file once it is executed
setopt inc_append_history

# Reloads history whenever you use it
setopt share_history

# Better dir colors
test -r "$HOME/.dir_colors" && eval $(dircolors -b "$HOME/.dir_colors")

# Edit line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^x^e' edit-command-line

# zinit
source ~/.zinit/bin/zinit.zsh

# command-time
zinit ice wait lucid
zinit light popstas/zsh-command-time
ZSH_COMMAND_TIME_MIN_SECONDS=10
ZSH_COMMAND_TIME_EXCLUDE=(ssh xxh vi vim ex ed tmux z zi top htop btm)

# history-substring-search
zinit ice wait"0a" lucid
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# syntax highlighting
zinit ice wait"0b" lucid
zinit light zsh-users/zsh-syntax-highlighting
# highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern line cursor root)
# colors
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[cursor]='bg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
# patterns
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('rm*-rf*' 'fg=white,bold,bg=red')

# autosuggestions
zinit ice wait"0c" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# completions
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions \
    Aloxaf/fzf-tab

# minimal2
zinit light subnixr/minimal
MNML_OK_COLOR=6

# Source everything from ~/.zsh/*.zsh
for f ("$HOME"/.zsh/*.zsh) . $f

# fzf
test -r /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/key-bindings.zsh
test -r /usr/share/fzf/completion.zsh && source /usr/share/fzf/completion.zsh

# zoxide
command -v zoxide > /dev/null && eval "$(zoxide init zsh)"

setopt clobber
