#
# Cookbook:: InstallTomcat
# Recipe:: CreateConfigFile
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - Create tomcat config file from template
template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.erb'
  mode '0755'
  owner 'root'
  group 'root'
  action :create
end

# rspencer - reload service to apply new config
service 'tomcat' do
  action :reload
end
