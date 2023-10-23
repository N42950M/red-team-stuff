this should be run with

ansible-playbook playbook.yml -i inventory.ini --user=<username> -e "ansible_become_pass=<password>"

obviously the username and password are accounts with sudo
the list of target ips should go in the inventory.ini file one line at a time