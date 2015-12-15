alias gitinit='git init && git add . && git commit -m "Init this commit in it"'
alias upmast="git stash && git checkout master && git pull --rebase origin master && git stash pop"
alias upstream="git stash && git checkout master && git pull --rebase upstream master && git push origin master && git stash pop"
alias brclean="git stash && git checkout master && git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d && git stash pop"

alias grep="\grep --color=auto"
alias egrep="\egrep --color=auto"

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'

bamgruntstart() {
	tmux split-window -v && tmux send-keys -t 2 \
	"vagrant ssh -c 'cd /opt/bamx; docker rm grunt_server; make docker-grunt-serve;'" Enter;
	grunt serve;
}

bamstart() {
	vagrant up && vagrant ssh -c \
	"cd /opt/bamx && docker-compose up -d &&
	docker exec -it bamx_web_1 bash -c 'make reset_db; make reset_stats_db'";
	grunt serve;
}

rebase() {
	re='^[0-9]+$'
	if [[ $1 =~ $re ]]
	then
		git stash && git rebase -i HEAD~$1 && git stash pop
	else
		git stash && git rebase $1 && git stash pop
	fi
}

sandr() {
	find $1 -type f -exec sed -i -e "s/$2/$3/g" {} \;
}

export VISUAL=vim
export EDITOR="$VISUAL"
