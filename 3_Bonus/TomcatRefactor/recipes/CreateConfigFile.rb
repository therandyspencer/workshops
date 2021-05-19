#
# Cookbook:: InstallTomcat
# Recipe:: CreateConfigFile
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - Create config file for tomcat
case node['platform']
when 'redhat', 'centos'
  template '/etc/systemd/system/tomcat.service' do
    source 'centos-tomcat.erb'
    mode '0755'
    owner 'root'
    group 'root'
    action :create
  end
when 'ubuntu', 'debian'
  template '/etc/systemd/system/tomcat.service' do
    source 'ubuntu-tomcat.erb'
    mode '0755'
    owner 'root'
    group 'root'
    action :create
  end
end

# rspencer - reload service to apply new config
service 'tomcat' do
  action :reload
end
