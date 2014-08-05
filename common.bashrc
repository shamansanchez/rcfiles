#
# ~/common.bashrc
#

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return


alias l='ls -la'


export PS4='${BASH_SOURCE}::$LINENO + '

export EDITOR=vim

function colorlist () 
{ 
    for c in $(seq 0 255)
        do echo $(EXT_COLOR $c)$c 
    done | column -c 50 

    echo -ne "\033[0m"
}
export -f colorlist

function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }
function EXT_BG_COLOR () { echo -ne "\033[48;5;$1m"; }

function EXT_PS1_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }
function EXT_PS1_BG_COLOR () { echo -ne "\[\033[48;5;$1m\]"; }

export -f EXT_COLOR
export -f EXT_BG_COLOR
export -f EXT_PS1_COLOR
export -f EXT_PS1_BG_COLOR


function buildPS1 ()
{
    pcolor=$(EXT_PS1_COLOR $1)
    usercolor=$(EXT_PS1_COLOR $2)
    wdcolor=$(EXT_PS1_COLOR $3)
    hostcolor=$(EXT_PS1_COLOR $4)

    echo "$pcolor[$usercolor\u $wdcolor\w$pcolor]\n$hostcolor\h$(EXT_PS1_COLOR 15) \$ ";
}
export -f buildPS1
