#!/bin/bash

blkid /dev/nvme1n1
if [ $? -ne 0 ]; then
      mkfs /dev/nvme1n1
fi

mkdir  -p /var/lib/jenkins
mount /dev/nvme1n1 /var/lib/jenkins

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins

echo 2.0 > /var/lib/jenkins/jenkins.install.UpgradeWizard.state
cp -R /tmp/admin-create.groovy /var/lib/jenkins/init.groovy.d/basic-security.groovy


chown jenkins:jenkins /var/lib/jenkins -R

systemctl enable jenkins
systemctl start jenkins

