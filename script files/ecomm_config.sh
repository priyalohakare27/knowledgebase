#!/bin/bash

##### Prerequisites for running this script #####

#1.	Script only runs on CentOS [RPM based systems].
#2.	This script is the configuration setup for ecomm project.

##### Copying Artifacts from Jenkins build #####

sudo cp /var/lib/jenkins/job/ecomm_priya/workspace/ecomm_project.zip /opt/rh/httpd24/root/var/www/html
echo "**********************************************************************"
echo "Copied Artifact from Jenkins build "
echo "**********************************************************************"

##### Uzip the Zipped project#####

sudo mkdir /opt/rh/httpd24/root/var/www/html/ecomm_project_priya
cd /opt/rh/httpd24/root/var/www/html/ecomm_project_priya
sudo unzip /var/lib/jenkins/job/ecomm_priya/workspace/ecomm_project.zip
sudo chmod -R 777 /opt/rh/httpd24/root/var/www/html/ecomm_project_priya
echo "**********************************************************************"
echo "Artifact Unzipped "
echo "**********************************************************************"

##### Configuring the host file #####

sudo mkdir /opt/rh/httpd24/root/var/www/html/ecomm_project_priya/host
sudo chmod 777 /opt/rh/httpd24/root/var/www/html/ecomm_project_priya/host
sudo touch /opt/rh/httpd24/root/var/www/html/ecomm_project_priya/host/host_config 
sudo chmod 777 /opt/rh/httpd24/root/var/www/html/ecomm_project_priya/host/host_config
cd /opt/rh/httpd24/root/var/www/html/ecomm_project_priya/host/
sudo echo "<VirtualHost *:80>" >> host_config
sudo echo "   ServerAdmin webmaster@example.com" >> host_config
sudo echo    "DocumentRoot /opt/rh/httpd24/root/var/www/html/ecomm_project_priya/" >> host_config
sudo echo  "ServerName ecomm1" >> host_config
sudo echo  "ServerAlias ecomm1" >> host_config
sudo echo  "#ErrorLog /etc/var/www/example.com/error.log" >> host_config
sudo echo  "#CustomLog /var/www/example.com/requests.log" >> host_config
sudo echo  "</VirtualHost>" >> host_config
sudo echo  "               " >> host_config
sudo echo  "               " >> host_config
sudo echo  "               " >> host_config
sudo echo  "               " >> host_config
sudo echo "127.0.0.1 www.ecom1.com" >> host_config

cp /etc/hosts . 
sudo chmod 666 hosts
tail -n2 host_config >> hosts
sudo cp hosts /etc
rm hosts
cp /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf .
sudo chmod 666 httpd.conf
head -n8 sumit_hosts >> httpd.conf
sudo cp httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/
rm httpd.conf



echo "**********************************************************************"
echo "Host file configured "
echo "**********************************************************************"

##### Starting Services #####
sudo service httpd stop
sudo service httpd24-httpd restart


echo "**********************************************************************"
echo "Services Started"
echo "**********************************************************************"


echo "**********************************************************************"
echo "Visit ecomm1"
echo "**********************************************************************"


