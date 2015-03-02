if [ $(id -u) -eq 0 ];
then
	echo "Whoops, you are running as root"
	exit 1;
fi

if [ ! -z $(which yum) ];
then
  source ~/.bash/installScripts/yum.sh
elif [ ! -z $(which apt-get) ];
then
  source ~/.bash/installScripts/apt-get.sh
else
  echo "installer is not yum or apt-get"
  exit 2;
fi