#
# Cookbook:: InstallTomcat
# Recipe:: WgetFile
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - Execute code block as root, starting in /tmp,
# pull file with wget, unzip it with gzip, unpack it with tar into /opt/tomcat
# and strip 1 leading component from filename, change directory to /opt/tomcat,
# update group permissions on /opt/tomcat, add read permission to conf directory,
# add execute permission for conf directory, change owner recusively on directories
bash 'WgetFile' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
      wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.65/bin/apache-tomcat-8.5.65.tar.gz
      gzip -d apache-tomcat-8.5.65.tar.gz
      sudo tar -xvf apache-tomcat-8.5.65.tar -C /opt/tomcat --strip-components=1
      cd /opt/tomcat
      sudo chgrp -R tomcat /opt/tomcat
      sudo chmod -R g+r conf
      sudo chmod g+x conf
      sudo chown -R tomcat webapps/ work/ temp/ logs/
    EOH
end
