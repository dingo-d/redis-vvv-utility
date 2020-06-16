#!/usr/bin/env bash

echo "Setting up Redis"

echo "Update packages"
sudo apt-get update

echo "Install build-essential"
# Check if build-essential is installed, if not, install it
if [ $(dpkg-query -W -f='${Status}' build-essential 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get --assume-yes install build-essential;
fi

echo "Install tcl"
# Check if tcl is installed, if not, install it
if [ $(dpkg-query -W -f='${Status}' tcl 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get --assume-yes install tcl;
fi

echo "Getting latest Redis release"
# Check if latest redis is downloaded, if not, download it
if [ ! -f redis-stable.tar.gz ]; then
  wget http://download.redis.io/redis-stable.tar.gz
  tar xvzf redis-stable.tar.gz && cd redis-stable
fi
# Check before executing make if it's already installed
cd redis-stable
make
make test

echo "Setting up default config at /usr/local/etc/redis.conf"
cp /usr/local/etc/redis.conf.default /usr/local/etc/redis.conf

mkdir -p /usr/local/var/db/redis

echo "Install Redis"
sudo make install

cd utils

echo "Starting Redis server"
sudo ./install_server.sh

redis-cli ping
if [ $? -eq 0 ]; then
  echo "Redis is working!"
else
  echo "Something went wrong :("
fi
