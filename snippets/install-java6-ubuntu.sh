#!/bin/bash

set -e

if [ $(whoami) != "root" ]; then
  echo "Need to run as root, becase we're installing stuff"
fi

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java6-installer
