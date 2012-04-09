This repository contains a Fedora 16 i386 [VeeWee](https://github.com/jedi4ever/veewee-old) template which can be used to build a [Vagrant base box](http://vagrantup.com/docs/boxes.html).  It will install the latest VirtualBox Guest Additions and create a user account called 'vagrant', with the password set to 'vagrant'.

## Installation

These instructions assume that you are using Ruby 1.9.3 with RVM.

    $ gem install vagrant
       $ gem install veewee

Clone this repository.

    $ git clone https://github.com/avtar/fedora-16-i386.git

Create an 'iso' directory in your newly cloned working directory, and download the Fedora 16 i386 NetInstall ISO.

    $ cd fedora-16-i386
       $ mkdir iso
       $ curl http://mirror.csclub.uwaterloo.ca/fedora/linux/releases/16/Fedora/i386/iso/Fedora-16-i386-netinst.iso \
      -o iso/Fedora-16-i386-netinst.iso

Begin building the box.  The installer will prompt you during the file system partitioning phase, asking for confirmation before it erases the virtual drive.  Once you agree to that the rest of the installation will proceed unattended.  This should take a couple of minutes depending on the speed of your internet connection.  The virtual machine will restart itself twice.  The last time it does so, it will run the postinstall.sh script which install the Guest Additions among other necessary changes.

    $ vagrant basebox build 'Fedora-16-i386'

If all went well, you should see a Fedora login prompt.  You can now export the base box.

    $ vagrant basebox export Fedora-16-i386

You should now have a 'Fedora-16-i386.box' file.  This will need to be imported before Vagrant can begin using it.

    $ vagrant box add 'Fedora-16-i386' 'Fedora-16-i386.box'