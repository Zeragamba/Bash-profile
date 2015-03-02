source ~/.bash/installScripts/utilities/ptMono.sh

if [ -z $(which htop) ];
then
	sudo apt-get install htop -y
fi

if [ -z $(which git) ];
then
	sudo apt-get install git -y
fi

if [ -z $(which nautilus) ];
then
	sudo apt-get install nautilus-open-terminal -y
	nautilus -q
fi

if [ -z $(which subl) ];
then
	# get the installer
	sudo add-apt-repository ppa:webupd8team/sublime-text-3
	sudo apt-get update
	sudo apt-get install sublime-text-installer -y

	# install package manager
	mkdir -p ~/.config/sublime-text-3/Installed\ Packages
	cd ~/.config/sublime-text-3/Installed\ Packages
	wget https://sublime.wbond.net/Package%20Control.sublime-package

	# clone my settings
	mkdir -p ~/.config/sublime-text-3/Packages
	cd ~/.config/sublime-text-3/Packages
	rm -rf User
	mkdir -p ~/.config/sublime-text-3/Packages/User
	git clone https://github.com/SpyMaster356/Sublime-Settings User

	# start sublime once to let package manager run
	subl
fi

if [ -z $(which ruby) ];
then
	sudo apt-get install ruby-full -y
fi

if [ -z $(which curl) ];
then
	sudo apt-get install curl -y
fi

if [ -z $(which nvm) ];
then
	curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | bash
fi
