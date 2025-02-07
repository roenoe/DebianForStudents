#!/bin/bash

# Install necessary software
apt install neovim git vsftpd curl wget sudo

# Add default user "im" to sudo user group
usermod -aG sudo im

# Set correct ftp options
rm /etc/vsftpd.conf
cp etc-vsftpd.conf /etc/vsftpd.conf
systemctl restart vsftpd

# This needs to be at the bottom of the file
rm /etc/network/interfaces
cp etc-network-interfaces /etc/network/interfaces
