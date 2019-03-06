#!/usr/bin/env bash

#helper function
log_message()
{
    LOGPREFIX="[$(date '+%Y-%m-%d %H:%M:%S')][provision]"
    MESSAGE=$1
    echo "$LOGPREFIX $MESSAGE"
}

#check for errors
check_errors()
{
    EXITCODE=$1
    if [ $EXITCODE -ne 0 ]; then
        log_message "ERROR: there were some errors, check the ouput for details."
        exit 1
    else
        log_message "OK, operation successfully completed."
    fi
}
# update DNS
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# update system libs
sudo apt-get -y update
check_errors $?
sudo apt-get -y upgrade
check_errors $?

# install common system libs
sudo apt-get install -y mc joe git multitail screen nmap python-pip htop iotop jnettop elinks pydf zip
check_errors $?

# install docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
check_errors $?

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
check_errors $?

sudo apt-key fingerprint 0EBFCD88
check_errors $?

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
check_errors $?

sudo apt-get update
check_errors $?

sudo apt-get install -y docker-ce
check_errors $?

sudo docker run hello-world
check_errors $?

sudo usermod -aG docker vagrant
check_errors $?

sudo pip install docker-compose
check_errors $?

docker-compose version
check_errors $?


