#!/bin/bash

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
echo "This devices IP address is now $IP. To change this, edit the bottom line of /etc/network/interfaces"

# Actually set it
echo "  address $IP" >> /etc/network/interfaces
systemctl restart networking.service
ifdown ens18
ifup ens18

# Set the password to expired so the user has to set a password on first login
passwd --expire im

# Delete old ssh keys
confirm="n"
read -p "Are you sure you want to regenerate your ssh keys?" -n 1 -r confirm
if [[ $confirm =~ [Yy]$ ]]
then
  /bin/rm -v /etc/ssh/ssh_host_*
  dpkg-reconfigure openssh-server
  systemctl restart ssh
fi

