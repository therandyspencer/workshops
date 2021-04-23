#
# Cookbook:: InstallTomcat
# Recipe:: PrepareService
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - start tomcat
service 'tomcat' do
  action :start
end

# rspencer - start tomcat on boot
service 'tomcat' do
  action :enable
end
