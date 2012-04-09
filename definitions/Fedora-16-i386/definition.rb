Veewee::Session.declare({
  # Minimum RAM requirement for installation is 768MB.
  :cpu_count => '2', :memory_size=> '2048',
  :disk_size => '10140', :disk_format => 'VDI', :hostiocache => 'off', :hwvirtext => 'on',
  :os_type_id => 'Fedora',
  :iso_file => "Fedora-16-i386-netinst.iso",
  # Feel free to pick a local mirror: http://mirrors.fedoraproject.org/publiclist/Fedora/16/i386/
  :iso_src => "http://mirror.csclub.uwaterloo.ca/fedora/linux/releases/16/Fedora/i386/iso/Fedora-16-i386-netinst.iso",
  :iso_md5 => "d7d7646ee2d8cecb9070b8b1117b9a1b",
  :iso_download_timeout => 1000,
  :boot_wait => "10", :boot_cmd_sequence => [ '<Tab> linux text biosdevname=0 ks=http://%IP%:%PORT%/ks.cfg<Enter><Enter>' ],
  :kickstart_port => "7122", :kickstart_timeout => 10000, :kickstart_file => "ks.cfg",
  :ssh_login_timeout => "100", :ssh_user => "vagrant", :ssh_password => "vagrant", :ssh_key => "",
  :ssh_host_port => "7222", :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/halt -h -p",
  :postinstall_files => [ "postinstall.sh"], :postinstall_timeout => 10000
})
