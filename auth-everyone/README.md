this should be run with

ansible-playbook playbook.yml -i inventory.ini --user= -e ansible_ssh_pass= ansible_become_pass=  

obviously the username and password are accounts with sudo
become pass is the sudo pass which should just be the account password

alternatively the inventory file could be edited so the list of ips is
ip ansible_connection=ssh ansible_ssh_user=user ansible_ssh_pass= ansible_become_pass=
and then the extra arguments would not be needed

### currently ansible is a lil broke and the counting variable doesnt count when run with ansible :thinking:, I'm going to figure out why before comp but the script works when run locally yourself