# DebianForStudents

## Setup

### Template
Make a template vm by creating a vm with debian netinst and going through the install process. The user's name should be `im`\
After that, log in with the root account.\
Install git `apt install git`\
Make a src directory to store the required files `mkdir src && cd src`\
Clone this repo `git clone https://github.com/roenoe/DebianForStudents && cd DebianForStudents`

Turn the vm off `poweroff`, then make the vm into a template in proxmox

## Sources
[useful ftp guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-20-04)
[regenerate ssh keys](https://www.cyberciti.biz/faq/howto-regenerate-openssh-host-keys/)
