export EDITOR=vim

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

check_conda_env () {
    if [[ ! -z "$CONDA_DEFAULT_ENV" && "$CONDA_DEFAULT_ENV" != "base" ]]; then
        echo " [$CONDA_DEFAULT_ENV] "
    else
        echo " "
    fi
}

export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;00m\]\$(check_conda_env)\[\033[01;31m\]\$(parse_git_branch)\[\033[01;34m\] \w \$\[\033[00m\] "

# change title of terminal when sshing
function title()
{
  # change the title of the current window or tab
  # tested on xfce4-terminal
  PROMPT_COMMAND="echo -ne \"\033]0;$1\007\";"
}

function titleuserhost() { title $USER@$HOSTNAME; }

function ssh()
{       
  /usr/bin/ssh "$@" titleuserhost
  # revert the window title after the ssh command
  titleuserhost
}

function su()
{
  /bin/su "$@"
  # revert the window title after the su command
  titleuserhost
}
titleuserhost
