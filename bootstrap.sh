#!/bin/sh

################
# Bootstrap the workstation
#
# Copyright: Chris Pray
# All rights reserved
################

if [ -f ~/Downloads/chefdk_0.9.0-1_amd64.deb ]; then
	echo "chefdk found"
else
	wget -O ~/Downloads/chefdk_0.9.0-1_amd64.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.9.0-1_amd64.deb
	if [ $? -ne 0 ]; then
		echo "failed to download chefdk"
		exit 1
	fi
fi

if [ -f /opt/chefdk ]; then
	echo "chefdk installed"
else
	sudo dpkg -i ~/Downloads/chefdk_0.9.0-1_amd64.deb
	if [ $? -ne 0 ]; then
		echo "failed to install chefdk"
		exit 1
	fi
fi


