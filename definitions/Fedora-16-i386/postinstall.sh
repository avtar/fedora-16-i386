#!/bin/bash

date > /etc/vagrant_box_build_time
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

yum -y update
yum -y install \
 bzip2 \
 ruby \
 ruby-devel \
 rubygems \
 tar \
 zlib-devel

# Install vagrant dependencies
gem install \
 chef \
 puppet \
 erubis \
 highline \
 json \
 mime-types \
 net-ssh \
 polyglot \
 rest-client \
 treetop \
 uuidtools \
 --no-rdoc --no-ri

# Suppress a puppet error by creating the following group
groupadd puppet

# Install VirtualBox Guest Additions
cd /tmp
wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop,ro VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
bash /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions_$VBOX_VERSION.iso
restorecon -R -v /opt

# Disable Fedora Firstboot questions
echo "RUN_FIRSTBOOT=NO" > /etc/sysconfig/firstboot

# Enable graphical login
ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

exit

# EOF
