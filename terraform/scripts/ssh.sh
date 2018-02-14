#!/bin/bash

echo "SSH"
# Copy SSH credentials to sudo user
mkdir /home/developer/.ssh
cp -rp ~/.ssh/. /home/developer/.ssh
sudo chown -R developer:developer /home/developer/.ssh
# Disable root login
sed -i '/^PermitRootLogin[ \t]\+\w\+$/{ s//PermitRootLogin without-password/g; }' /etc/ssh/sshd_config
# Disable password authentication
sed -i '/^PasswordAuthentication[ \t]\+\w\+$/{ s//PasswordAuthentication no/g; }' /etc/ssh/sshd_config
# Restart SSH
service ssh restart
