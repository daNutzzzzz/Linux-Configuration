#Set Terminal to Default Colorful Configuration

nano ~/.bashrc

tail -n 1 ~/.bashrc


# Enable colored output in ls
alias ls='ls --color=auto'

# Colorful prompt (PS1)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Enable colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Colorize grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'



source ~/.bashrc