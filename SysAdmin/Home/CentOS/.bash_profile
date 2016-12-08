# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#
# User specific environment and startup programs
#
export rmv="/media/sf_Brad_Transfer"
export fls="/media/sf_Brad_Flash"
export p="${rmv}/Projects/Sturdyworks"
export g="${rmv}/Documents/Guides"
export c="${rmv}/Documents/Career"
export cg="${rmv}/Documents/Career/Guides"
export ci="${rmv}/Documents/Career/Interviews"
export d="${HOME}/Develop"
export dr="${rmv}/Develop"
export ds="${d}/src"
export dp="dotfiles"
export dc="${ds}/${dp}"        # current development code
export dt="${d}/tmp"
export da="${dr}/assets"
export daj="${da}/js"
export dap="${da}/python"
export dhj="${dr}/hacks/js"
export dhp="${dr}/hacks/python"
export dpj="${dr}/proofs/js"
export dpp="${dr}/proofs/python"
export s="${HOME}/Software"
export ww="${s}/Nginx"
export wp="sturdyworks-org"
export wd="${ww}/html/${wp}"  # current staging code
export wa="${ww}/logs/access.log"
export we="${ww}/logs/error.log"

#
# Python
#
# virtualenvwrapper setup for Python virtual environments
export WORKON_HOME="${HOME}/Envs"
export PROJECT_HOME="${ds}"

#
# EDITOR for login shell (without VISUAL GUI)
#
export VISUAL=''
export EDITOR="emacs -nw"

#
# Add HOME Bin directory
#
PATH=$PATH:$HOME/.local/Bin:$HOME/in
export PATH
