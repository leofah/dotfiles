# git aliases
alias g='git'
alias gs='git status'
alias gi='git init'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gpl='git pull'
alias gp='git push'
alias gf='git fetch'
alias gm='git merge'
alias gb='git branch'
alias gl='git log'
alias gd='git diff'
alias gch='git checkout'

# Paths
alias 7sem='cd ~/Documents/Studium/7.Semester'

# show specific files
alias music='cat ~/Documents/TODO/music.txt'
alias movies='cat ~/Documents/TODO/movies.txt'

# run alias commands with sudo
alias sudo='sudo '

alias o='xdg-open'
alias v='vim'

# quality of life
alias pingd="ping $(ip route | awk '/^default via/ { print $3 ; exit }')" # ping the default gateway
