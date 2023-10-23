this should be run with

ansible-playbook playbook.yml -i inventory.ini --user= -e ansible_ssh_pass= ansible_become_pass=  

obviously the username and password are accounts with sudo
become pass is the sudo pass which should just be the account password

alternatively the inventory file could be edited so the list of ips is
ip ansible_connection=ssh ansible_ssh_user=user ansible_ssh_pass= ansible_become_pass=
and then the extra arguments would not be needed