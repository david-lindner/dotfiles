export EDITOR=vim

# initalize autojump
. /usr/share/autojump/autojump.sh

# nohup which prints to stdout instead of buffering
# http://stackoverflow.com/questions/25674613/python-nohup-out-dont-show-print-statement
alias nohupbuf='nohup stdbuf -oL'

# tmux with 256 colors
alias tmux='tmux -2'
alias grep='grep --color=always'

# adding git branch to debian default prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/^\* \(.*\)$/(\1)/"
}

export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h \[\033[01;31m\]\$(parse_git_branch)\[\033[01;34m\] \w \$\[\033[00m\] "
