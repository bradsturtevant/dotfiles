# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

#
# User specific aliases and functions
#

#
# EDITOR for interactive VISUAL GUI
#
export EDITOR="emacs"
export VISUAL=="emacs"

#
# Emacs
#
function em { emacs "$@" & }
# fallback to emacs if server not started)
function ec { emacsclient -q -n -a emacs "$@" & }


# Graphical Diff, Still long for IRIX gdiff
function gdiff { p4merge "$@" & }

#
#  Aliases for export path variables in .profile
#
alias cdp="cd ${p}"
alias cdg="cd ${g}"

alias cdc="cd ${c}"
alias cdcg="cd ${cg}"
alias cdci="cd ${ci}"

alias cdd="cd ${d}"
alias cdds="cd ${ds}"
alias cddc="cd ${dc}"
alias cddt="cd ${dt}"
alias cdda="cd ${da}"
alias cddaj="cd ${daj}"
alias cddap="cd ${dap}"
alias cddhj="cd ${dhj}"
alias cddhp="cd ${dhp}"
alias cddpp="cd ${dpp}"
alias cddpj="cd ${dpj}"
alias cds="cd ${s}"
alias cdww="cd ${ww}"
alias cdwd="cd ${wd}"
alias tailwa="tail -f ${wa}"
alias tailwe="tail -f ${we}"

#
# Python
#
# virtualenvwrapper setup for Python virtual environments
source /usr/local/bin/virtualenvwrapper.sh


