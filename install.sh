sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get install software-properties-common -y &&\
sudo add-apt-repository ppa:ondrej/php -y && \
sudo apt-get update && \
sudo apt-get install php7.2 -y && \
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && php composer-setup.php && php -r "unlink('composer-setup.php');" && sudo mv composer.phar /usr/local/bin/composer && apt-get -y install git zip unzip && \
composer global require friendsofphp/php-cs-fixer &&\
composer global require "squizlabs/php_codesniffer=*" && \
sudo apt-get remove docker docker-engine docker.io -y && \
sudo apt-get update &&\
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common && \

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&\
sudo apt-key fingerprint 0EBFCD88 -y && \
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable" -y && \
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 && \
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && \

#skype
sudo apt install apt-transport-https -y &&\
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add - &&\
echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list &&\

# gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb &&\
sudo dpkg -i gitkraken-amd64.deb &&\
rm gitkraken-amd64.deb &&\

# Typora
# optional, but recommended
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE &&\
# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./' -y &&\

# vs code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&\
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&\
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&\

sudo apt-get update && \
sudo apt-get install docker-ce -y && \
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose &&\
docker-compose --version && \
sudo apt-get install default-jre  default-jdk graphviz vim mysql-workbench spotify-client  skypeforlinux code typora -y &&\

# 關閉阿怕企自動啟動
sudo update-rc.d apache2 disable &&\

# enable ufw
sudo ufw enable && \
sudo ufw default deny incoming &&\
sudo ufw allow ssh &&\
sudo ufw logging on &&\

# 記得加上 ibus chewing & chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&\
sudo dpkg -i google-chrome-stable_current_amd64.deb &&\
sudo apt-get install -f &&\
rm google-chrome-stable_current_amd64.deb &&\
sudo apt install ibus-chewing -y && \
ibus-setup
