include make-app.mk
include make-ansible.mk


production-deploy:
	ansible-playbook ansible/deploy.yml -i ansible/production -u root -vvv