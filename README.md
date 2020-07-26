# About This Repo #
This is a Ansible home directory to deploy and configure Elastic Stack and Zabbing monitoring software. The playbooks are:
 
1. **elk.yml - to deploy and configure Elastic Search with separate master and data nodes. In the inventory add the hosts to the group "elk_master_nodes" for master nodes, and "elk_data_nodes" for data nodes. To change the configuration, please modify "group_vars/elastic".**
2. **logstash.yml - to deploy and configure the Logstash instances. In the inventory add the hosts to the group "logstash".To change the configuration, please modify "group_vars/elastic".**
3. **kibana.yml - to deploy and configure the Kibana instances. In the inventory add the hosts to the group "kibana". To change the configuration, please modify "group_vars/elastic".**
4. **nginx.yml - to deploy and configure the Nginx load balancer. In the inventory add the hosts to the group "elk_nginx" To change the configuration, please modify "group_vars/elastic".**
5. **zabbix_server.yml - to deploy and configure Zabbix monitoring system. In the inventory add the hosts to the group "zabbix_db" for DB server, "zabbix_srv" - for Zabbix server, "zabbix_web" - for Zabbix Web. To change the configuration, please modify "group_vars/zabbix".**
6. **zabbix_server_javagw - do deploy the Zabbix gateway to monitor JMX Java application.
monitor_logs.yml - to deploy and configure filebeat agents to collect logs. In the inventory add the hosts to the group "monitor_logs" . To change the configuration, please modify "group_vars/monitor_logs".**
7. **monitor_metric.yml - to deploy and configure metricbeat agents to collect metric. In the inventory add the hosts to the group "monitor_metric" . To change the configuration, please modify "group_vars/monitor_metric".**
8. **monitor_zabbix.yml - to deploy and configure filebeat agents to collect logs. In the inventory add the hosts to the group "monitor_zabbix" . To change the configuration, please modify "group_vars/monitor_zabbix".**
9. **grafana.yml - to deploy and configure Grafana. In the inventory add the hosts to the group "grafana" . To change the configuration, please modify "group_vars/grafana".**
10. **site.yml - to set environment for hosts (hostname, time sync, etc.). Based on the common role.**





# Ansible Tips #
In your roles directory, type ansible-galaxy init <em>role_name</em> in order to generate an empty skeleton for a new role you are working on.

Example:
<pre>
ansible-galaxy init nginx
</pre>

Check out [Ansible Examples](https://github.com/ansible/ansible-examples) for example playbooks.

# Best Practices Directory Layout #

Based on [Ansible Best Practices](https://docs.ansible.com/ansible/playbooks_best_practices.html#directory-layout)

<pre>
production                # inventory file for production servers
staging                   # inventory file for staging environment

group_vars/
   group1                 # here we assign variables to particular groups
   group2                 # ""
host_vars/
   hostname1              # if systems need specific variables, put them here
   hostname2              # ""

library/                  # if any custom modules, put them here (optional)
filter_plugins/           # if any custom filter plugins, put them here (optional)

site.yml                  # master playbook
webservers.yml            # playbook for webserver tier
dbservers.yml             # playbook for dbserver tier

roles/
    common/               # this hierarchy represents a "role"
        tasks/            #
            main.yml      #  <-- tasks file can include smaller files if warranted
        handlers/         #
            main.yml      #  <-- handlers file
        templates/        #  <-- files for use with the template resource
            ntp.conf.j2   #  <------- templates end in .j2
        files/            #
            bar.txt       #  <-- files for use with the copy resource
            foo.sh        #  <-- script files for use with the script resource
        vars/             #
            main.yml      #  <-- variables associated with this role
        defaults/         #
            main.yml      #  <-- default lower priority variables for this role
        meta/             #
            main.yml      #  <-- role dependencies

    webtier/              # same kind of structure as "common" was above, done for the webtier role
    monitoring/           # ""
    fooapp/               # ""
</pre>

