include make-app.mk
include make-ansible.mk


production-deploy:
	ansible-playbook ansible/deploy.yml -i ansible/production -u root -vvv

production-deploy-app:
	ansible-playbook ansible/deploy.yml -i ansible/production --tags app -u root -vv

production-deploy-nginx:
	ansible-playbook ansible/deploy.yml -i ansible/production --tags nginx -u root -vv

production-start-app:
	ansible-playbook ansible/deploy.yml -i ansible/production --tags env -u root -vv

production-start-nginx:
	ansible-playbook ansible/deploy.yml -i ansible/production --tags snginx -u root -vv