#!/bin/bash

    #Author : Franki S.
    #Date : Fev 2.23

    #----------------------- Description ------------------------------
    # This script automate the installation of SonarQube on CentOS

#This process need to be run as a regular user
    if [[ "${UID}" == 0 ]]
then
  echo "Sonarqube doesnt work when you start it as root user" >&2
  exit 1
fi
# Step 1: Java 11 installation
 sudo yum update -y
echo
echo
 sudo yum install java-11-openjdk-devel -y
echo
echo
 sudo yum install java-11-openjdk -y
echo
echo
#Step 2: Download SonarQube latest versions on your server
 cd /opt
echo
echo
 sudo yum install wget zip unzip -y
echo
echo
 sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
#Step 3: Extract packages
 sudo unzip /opt/sonarqube-9.3.0.51899.zip
echo
echo
#Step 4: Change ownership to the user and Switch to Linux binaries directory to start service
 sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
 cd /opt/sonarqube-x.x/bin/linux-x86-64 
 ./sonar.sh start
echo
echo
#Step 5: Open port 9000
 sudo firewall-cmd --permanent --add-port=9000/tcp 
 sudo firewall-cmd --reload
 echo
 echo
#Show endpoint
echo "SonarQube installed"
echo
echo "You should now be able to access SonarQube at: http://$(curl -s ifconfig.co):9000"
echo
echo "Your login is : admin and your password is :admin"
