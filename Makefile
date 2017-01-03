setup:
	ln -s ConfigFiles/.bash_profile ~/.bash_profile
	ln -s ConfigFiles/.tmux.conf ~/.tmux.conf
	ln -s ConfigFiles/.vimrc ~/.vimrc
	make plugin-setup

plugin-setup:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -o ~/.vim/autoload/pathogen.vim
	rm -rf ~/.vim/bundle/typescript-vim
	git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim
