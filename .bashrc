# number of commands to remember
export HISTSIZE=10000
# save history after every command
# (in case I want history from a running shell, or the shell crashes)
export PROMPT_COMMAND='history -a'
# log timestamps of commands
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

function diffe() { diff --width=$COLUMNS --side-by-side <(sed 's///g' "$1") <(sed 's///g' "$2") | less --prompt="${1//./\\.} vs ${2//./\\.}"; }
function kj() { jobs -p | while read pid; do echo $pid; kill -9 $pid; done; }
function hg() { history | grep $*; }

alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias gwd='git diff --word-diff=color'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gr='git rev-parse --short HEAD'
alias gco='git checkout'
alias gc='git commit'
alias gb='git branch'
alias ga='git add'
alias gca='git commit --amend'

export PATH="~/.local/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

module load open_mpi/1.6.5
module load git/2.11.0
# openblas and sqlite apparently needed for Python
# loading them manually prevents an extra print
module load new openblas/0.2.13_seq sqlite/3.15.0 gcc/4.8.2 python/3.6.0
alias vim=nvim
VIRTUAL_ENV_DISABLE_PROMPT=1 source ~/.venv/bin/activate
# makes ls colors more readable
eval "$(dircolors -b)"

export PYTHONUNBUFFERED=1
