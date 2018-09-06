#!/bin/bash
# Node, npm & MongoDB installation for Ubuntu 18.4

#Checking the OS
echo OS Version `lsb_release -d`
if [[ `lsb_release -d` != *"Ubuntu"* ]]
then
echo The OS should be Ubuntu
exit 0
fi

echo Starting Node installation...
sudo apt update
sudo apt install -y build-essential curl
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
nodejs -v
npm -v
echo Node installation Done!


echo Staring MongoDB installation...
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4#

#Ubuntu 14
if [[ `lsb_release -rs` == "14.04" ]]
then
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
fi

#Ubuntu 16
if [[ `lsb_release -rs` == "16.04" ]]
then
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
fi

#Ubuntu 18
if [[ `lsb_release -rs` == "18.04" ]]
then
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
fi

sudo apt-get update
sudo apt-get install -y mongodb-org
echo MongoDB installation Done!


echo Starting MongoDB
sudo service mongod start

#echo To stop MongoDB -> sudo service mongod stop
#sudo service mongod start
#sudo service mongod stop
#/var/log/mongodb/mongod.log


