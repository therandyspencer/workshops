#
# Cookbook:: InstallTomcat
# Recipe:: PullRemoteFile
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - Pull tarball from apache
remote_file '/tmp/apache.tar.gz' do
    owner 'tomcat'
    group 'tomcat'
    source 'https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.65/bin/apache-tomcat-8.5.65.tar.gz'
    action :create
    not_if { Dir.exist?('/opt/tomcat/bin') }
end


# rspencer - Unpack tarball
archive_file '/tmp/apache.tar.gz' do
    group 'tomcat'
    owner 'tomcat'
    mode '755'
    destination '/opt/apache'
    action :extract
    not_if { Dir.exist?('/opt/apache') }
end

# rspencer - create symlink
link '/opt/tomcat' do
    owner 'tomcat'
    group 'tomcat'
    to '/opt/apache/apache-tomcat-8.5.65'
    action :create
    link_type :symbolic
end

# rspencer - Give the tomcat group ownership over the entire installation directory
directory '/opt/tomcat' do
    group 'tomcat'
    action :create
    recursive true
end

# rspencer - give the tomcat group execute access to the directory itself
directory '/opt/tomcat/conf' do
    mode '750'
    group 'tomcat'
    action :create
  end
