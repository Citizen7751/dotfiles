#------------------------------------------------------------------------
#MY PART

#dependencies
# w3m, (surf), (python3)

#my aliases
alias c="clear"
alias e="exit"
alias q="exit"
alias weather="curl wttr.in"
alias sztaki="w3m https://szotar.sztaki.hu/"
alias ddg="w3m duckduckgo.com"
alias srf="surf lite.duckduckgo.com"
alias i="sudo apt install "
alias py="python3"
alias gr="ls | grep "
alias inv="surf https://docs.invidious.io/instances/"

# custom PS1
white="\033[1;37m"
green="\033[1;32m"
cyan="\033[1;36m"
yellow="\033[1;33m"
default="\033[0m"
printf "$white[$green$(date)$white]$default\n\n"

PS1="$white[$green\h$white]=[$cyan\u$white]=[$yellow\w$white]\n\\=\$$default "