#!/bin/bash

blkid /dev/xvdh
if [ $? -ne 0 ]; then
    mkfs.xfs /dev/xvdh
fi

mkdir  -p /var/lib/jenkins
mount /dev/xvdh /var/lib/jenkins

yum install java -y

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins -y

echo 2.0 > /var/lib/jenkins/jenkins.install.UpgradeWizard.state
mkdir -p /var/lib/jenkins/init.groovy.d
cp  /tmp/admin-create.groovy /var/lib/jenkins/init.groovy.d/basic-security.groovy
cp /tmp/plugins.groovy /var/lib/jenkins/init.groovy.d
cp /tmp/authorize.groovy /var/lib/jenkins/init.groovy.d

chown jenkins:jenkins /var/lib/jenkins -R

systemctl enable jenkins
systemctl start jenkins

echo /dev/xvdh /var/lib/jenkins xfs defaults 0 0 >>/etc/fstab

