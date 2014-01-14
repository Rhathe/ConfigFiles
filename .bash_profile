alias upmast="git stash && git checkout master && git pull --rebase upstream master && git push origin master && git stash pop"
alias brclean="git stash && git checkout master && git branch --merged | grep -v "\*" | xargs -n 1 git branch -d && git stash pop"

myrebase() {
re='^[0-9]+$'
if [[ $1 =~ $re ]]
then
	git stash && git rebase -i HEAD~$1 && git stash pop
else
	git stash && git rebase $1 && git stash pop
fi
}
alias rebase=myrebase

alias grep="\grep --color=auto"
alias egrep="\egrep --color=auto"
