#!/bin/sh
# Consider making this into something more like a puppet script.

# Install zsh
apt-get install -y zsh

sudo add-apt-repository ppa:webupd8team/java
sudo add-apt-repository ppa:webupd8team/sublime-text-3

sudo apt-get update

# Install oracle java
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections

echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections


apt-get install -y oracle-java6-installer
apt-get install -y oracle-java6-set-default

# Install sublime text 3
apt-get install -y sublime-text-installer

# Install xsel for clipboard management
apt-get install -y xsel

# Install all libraries needed to build python libaries
apt-get install -y python-dev libmysqlclient-dev


# Install ia32-libs.  This is needed for some android development.
# They changed the packages on 13.10.
. /etc/lsb-release
if [ "$DISTRIB_RELEASE" = "13.10" ]; then 
	apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0
else
	apt-get install -y ia32-libs
fi
