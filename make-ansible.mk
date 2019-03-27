project-files-touch:
	mkdir -p tmp
	touch tmp/ansible-vault-password

ansible-vaults-encrypt:
	#ansible-vault encrypt ansible/production/group_vars/all/vault.yml
	ansible-vault encrypt ansible/group_vars/all/vault.yml

ansible-vaults-decrypt:
	#ansible-vault decrypt ansible/production/group_vars/all/vault.yml
	ansible-vault decrypt ansible/group_vars/all/vault.yml

ansible-vaults-edit:
	ansible-vault edit ansible/production/group_vars/all/vault.yml --vault-password-file=tmp/ansible-vault-password
	#ansible-vault edit ansible/group_vars/all/vault.yml --vault-password-file=tmp/ansible-vault-password

terraform-vars-generate:
	ansible-playbook ansible/terraform.yml -i ansible/production -vv --vault-password-file=tmp/ansible-vault-password
