#
# Cookbook:: InstallTomcat
# Recipe:: AddLinuxUser
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - create tomcat group
group 'tomcat' do
  action :create
end

# rspencer - create user tomcat, set home directory but do not create it
# creating home directory when adding user will copy files from /etc/skel, which we do not want
user 'tomcat' do
  gid 'tomcat'
  manage_home false
  home '/opt/tomcat'
  shell '/bin/nologin'
  action :create
end
