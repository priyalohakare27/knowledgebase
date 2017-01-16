#!/bin/bash

##### Prerequisites for running this script #####

#1.	Script only runs on CentOS [RPM based systems].
#2.	This script is the environment setup for running a project.

sudo yum clean all

##### Installing PHP version 5.5.6 #####

sudo yum install php55-php
echo "**********************************************************************"
echo "PHP version 5.5.6  installed successfully."
echo "**********************************************************************"

##### Enabling PHP 5.5.6 #####

cd /
tail -n2 /opt/rh/php55/enable >> .bash_profile

##### Installing Xdebug.so #####

sudo yum clean all
sudo yum install php55-php-pecl-xdebug
echo "**********************************************************************"
echo "Xdebug installed successfully"
echo "**********************************************************************"


##### Installing Plugins for Magento#####

sudo yum install php55-php-mcrypt
sudo yum install php55-php-gd
sudo yum install php-xml
sudo yum install php55-php-mbstring.x86_64
sudo yum install php55-php-mysqlnd.x86_64
echo "**********************************************************************"
echo "Plugins installed successfully"
echo "**********************************************************************"


##### Installing Apache Server #####

sudo yum install httpd
sudo yum install httpd24-httpd.x86_64
echo "**********************************************************************"
echo "Apache Server  installed successfully"
echo "**********************************************************************"



##### Installing MySql #####

sudo yum install mysql
echo "**********************************************************************"
echo "MySql installed successfully"
echo "**********************************************************************"



##### Installing MySql-PHP driver #####

sudo yum install php55-php-mysql
echo "**********************************************************************"
echo "MySql-PHP driver installed successfully"
echo "**********************************************************************"

##### Starting Services #####

echo "**********************************************************************"
echo "Starting the Apache service"
echo "**********************************************************************"
sudo service httpd24-httpd start


echo "**********************************************************************"
echo "Starting the MySql service"
echo "**********************************************************************"
sudo service mysqld start

##### Deleting the script file #####

#sudo rm ecomm_env_setup.sh
