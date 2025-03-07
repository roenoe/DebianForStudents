# DebianForStudents

## Setup

### Template
This process will need to be repeated for the proxmox cluster in the server room and the proxmox server in 359.\
Make a template vm by creating a vm with debian netinst and going through the install process. The vm should have 2-8GB of RAM (this depends on how much is available), 1 CPU core, and 10GB of HDD. The user's name should be `im`\
After that, log in with the root account.\
Install git `apt install git`\
Make a src directory to store the required files `mkdir src && cd src`\
Clone this repo `git clone https://github.com/roenoe/DebianForStudents && cd DebianForStudents`

Turn the vm off `poweroff`, then make the vm into a template in proxmox\
Make as many hard copies of the vm as there are students in one of the classes. Choose the other class the next time you follow this guide.\
Log in to each of the vms as root and run the following command `cd src/DebianForStudents ; ./initialsetup.sh`. Follow the instructions. If you need to set a new IP address, you can edit /etc/network/interfaces or run the command again.

## Sources
[useful ftp guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-20-04)
[regenerate ssh keys](https://www.cyberciti.biz/faq/howto-regenerate-openssh-host-keys/)
