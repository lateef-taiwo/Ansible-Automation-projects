# Ansible-Automation-projects
This repository contains several ansible automation projects, such as deployment of nodejs application, deploying docker applications, automation of server updates, automating application deployment in k8s clusters and also running ansible from jenkins pipeline


## Dynamic Inventory
Dynamic inventories in Ansible allow you to generate an inventory of hosts and group them based on various sources such as cloud providers, databases, configuration management systems, or custom scripts. Ansible supports various dynamic inventory sources out of the box, including AWS EC2, Azure, GCP, OpenStack, and more. You can also create your own custom dynamic inventory script if needed.
So, if you have servers whose ip address and other features often change, you can use dynamic inventory scripts to configure them. In such cases, you don't need an hosts file or hosts.ini file, to specify the hosts ip adresses because they are dynamic.


The project directory for Dynamic Inventory is the ec2_inventory directory. Dynamic  It contains a terraform infrastructure folder for creatinf the infrastructure and also contains ansible playbook and inventory_aws_ec2.yaml file for the inventory.

### Targeting specific servers in the inventory.
You may want to run some updates or installations on some dev or staging servers while leaving the production servers in their previous state. In that case, you use use keyed groups and tags.

    keyed_groups:
        - key: tags
          prefix: tag

        - key: instance_type
          prefix: instance_type

Assuming you want to target instances with a tag "Name" that starts with "dev," you can use the --limit option to restrict the playbook execution to those instances. 
You can do it using:

    ansible-playbook -i inventory_aws_ec2.yaml your_playbook.yml --limit 'tag_Name_dev*'
