#!/usr/bin/env bash
apt-get update
apt-get install -y unattended-upgrades software-properties-common openjdk-7-jre-headless tomcat7
# [+] Common Files Done
apt-get update
# [+] Java Environment
echo "PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /home/vagrant/.bashrc
echo "export JAVA_HOME" >> /home/vagrant/.bashrc
echo "export JRE_HOME" >> /home/vagrant/.bashrc
echo "export PATH" >> /home/vagrant/.bashrc
# DL and Configure OpenAM
wget -O /tmp/OpenAM-12.0.0.war https://www.dropbox.com/s/wfaib6ua7bmupbk/OpenAM-12.0.0.war
mv /tmp/OpenAM-12.0.0.war /var/lib/tomcat7/webapps/openam.war
chown -R tomcat7:tomcat7 /usr/share/tomcat7
touch /usr/share/tomcat7/bin/setenv.sh
echo 'export CATALINA_OPTS="-server -Xmx2048m -XX:PermSize=512m"' >> /usr/share/tomcat7/bin/setenv.sh
chown tomcat7:tomcat7 /usr/share/tomcat7/bin/setenv.sh
chmod u+x /usr/share/tomcat7/bin/setenv.sh
service tomcat7 start
# [+] Done
