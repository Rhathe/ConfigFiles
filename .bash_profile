alias gitinit='git init && git add . && git commit -m "Init this commit in it"'
alias upmast="git stash && git checkout master && git pull --rebase origin master && git stash pop"
alias upstream="git stash && git checkout master && git pull --rebase upstream master && git push origin master && git stash pop"
alias brclean="git stash && git checkout master && git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d && git stash pop"

alias grep="\grep --color=auto"
alias egrep="\egrep --color=auto"

export LS_OPTIONS='--color=auto'
alias ls="\ls -FHG"

if [[ $(command -v brew) && -f $(brew --prefix)/etc/bash_completion ]]; then
	. $(brew --prefix)/etc/bash_completion
fi

if [ command -v git >/dev/null 2>&1 && command -v vim >/dev/null 2>&1 ]; then
	git config --global core.editor "vim"
fi

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
	LC_CTYPE=C LANG=C find $1 ! -name '*.pyc' -type f -print0 | xargs -0 grep -rl --null "$2" | xargs -0 sed -i '' -e "s/$2/$3/g"
}

gitclear() {
	git add .
	git stash
	git stash drop
}

fsandr() {
	export PATTERN="$2"
	export REPLACE="$3"
	find $1 -name "*$2*" -type f -exec bash -c 'NEWFILE="${1//$PATTERN/$REPLACE}"; mkdir -p `dirname $NEWFILE`; mv $1 $NEWFILE;' -- {} \;
}

fsandr() {
	export PATTERN="$2"
	export REPLACE="$3"
	find $1 -name "*$2*" -type f -exec bash -c 'NEWFILE="${1//$PATTERN/$REPLACE}"; mkdir -p `dirname $NEWFILE`; mv $1 $NEWFILE;' -- {} \;
}

export VISUAL=vim
export EDITOR="$VISUAL"
