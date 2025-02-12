#!/bin/bash

# Install necessary software
apt install neovim git vsftpd curl wget sudo

# Add default user "im" to sudo user group
usermod -aG sudo im

# Set correct ftp options
rm /etc/vsftpd.conf
cp etc-vsftpd.conf /etc/vsftpd.conf
systemctl restart vsftpd

# Reset the network interfaces
rm /etc/network/interfaces
cp etc-network-interfaces /etc/network/interfaces

# Set the correct IP address (or just one at all)
while [[ ! $confirm =~ [Yy]$ ]]
do
  echo "What are the last two octets in this computers IPv4 address?"
  read octet
  IP="10.20.$octet"
  echo "This device's IP address will now be set to $IP"
  read -p "Is this correct? [y/n]" -n 1 -r confirm
  echo
done
echo "This devices IP address is now $IP. To change this, simply rerun this setup script, or edit the bottom line of /etc/network/interfaces"

# Actually set it
echo "  address $IP" >> /etc/network/interfaces
systemctl restart networking.service
ifdown ens18
ifup ens18

# Set the password to expired so the user has to set a password on first login
passwd --expire im

# Delete old ssh keys
echo "Regenerating ssh keys"
/bin/rm -v /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server
systemctl restart ssh

