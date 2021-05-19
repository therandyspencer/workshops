#
# Cookbook:: InstallTomcat
# Recipe:: PrepareService
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - start tomcat
service 'tomcat' do
  supports status: true, restart: true, reload: true
  action [ :enable, :start ]
end
