echo "**********************************************************************"
echo "Coping Artifact from Buid "
echo "**********************************************************************"


sudo cp /var/lib/jenkins/workspace/Sumit_ECOMM1/ecomm_project.zip /opt/rh/httpd24/root/var/www/html

echo "**********************************************************************"
echo "Now Unzipping the Artifact "
echo "**********************************************************************"

sudo mkdir  /opt/rh/httpd24/root/var/www/html/ecomm_project
cd /opt/rh/httpd24/root/var/www/html/ecomm_project
sudo unzip  /opt/rh/httpd24/root/var/www/html/ecomm_project.zip
sudo chmod -R 777 /opt/rh/httpd24/root/var/www/html/ecomm_project


echo "**********************************************************************"
echo "Artifact Unzipped"
echo "**********************************************************************"

sudo mkdir  /opt/rh/httpd24/root/var/www/html/ecomm_project/pradeep; sudo chmod 777  /opt/rh/httpd24/root/var/www/html/ecomm_project/pradeep
sudo touch /opt/rh/httpd24/root/var/www/html/ecomm_project/pradeep/sumit_hosts; sudo chmod 777 /opt/rh/httpd24/root/var/www/html/ecomm_project/pradeep/sumit_hosts
cd /opt/rh/httpd24/root/var/www/html/ecomm_project/pradeep/
sudo echo "<VirtualHost *:80>" >> sumit_hosts
sudo echo "   ServerAdmin webmaster@example.com" >> sumit_hosts
sudo echo    "DocumentRoot /opt/rh/httpd24/root/var/www/html/ecomm_project/" >> sumit_hosts
sudo echo  "ServerName www.ecom1.com" >> sumit_hosts
sudo echo  "ServerAlias ecom1.com" >> sumit_hosts
sudo echo  "#ErrorLog /etc/var/www/example.com/error.log" >> sumit_hosts
sudo echo  "#CustomLog /var/www/example.com/requests.log" >> sumit_hosts
sudo echo  "</VirtualHost>" >> sumit_hosts
sudo echo  "               " >> sumit_hosts
sudo echo  "               " >> sumit_hosts
sudo echo  "               " >> sumit_hosts
sudo echo  "               " >> sumit_hosts
sudo echo "127.0.0.1 www.ecom1.com" >> sumit_hosts





echo "**********************************************************************"
echo "Domain Name Configuration"
echo "**********************************************************************"


cp /etc/hosts . ;sudo chmod 666 hosts; tail -n2 sumit_hosts >> hosts;sudo cp hosts /etc; rm hosts
cp /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf . ;sudo chmod 666 httpd.conf; head -n8 sumit_hosts >> httpd.conf;sudo cp httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/;rm httpd.conf

sudo service httpd24-httpd restart 



echo "**********************************************************************"
echo "you can visit www.ecom_new.com"
echo "**********************************************************************"


















