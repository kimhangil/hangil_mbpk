#! /bin/sh

if [ -d /home/ec2-user/build ]; then
    sudo rm -rf /home/ec2-user/build/
    sudo mkdir /home/ec2-user/build/
fi

if [ -d /usr/local/tomcat/webapps/ROOT ]; then
    sudo rm -rf /usr/local/tomcat/webapps/ROOT.war
    sudo rm -rf /usr/local/tomcat/webapps/ROOT
fi

