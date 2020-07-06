ansible -i production all -u root -m yum -a "name=filebeat state=absent"
