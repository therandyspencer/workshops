package 'java-1.7.0-openjdk-devel' do
    action :installed
end

group 'tomcat' do
  action :create
end

user 'tomcat' do
    action :create
    home '/opt/tomcat'
    shell '/bin/nologin'
    gid 'tomcat'
    manage_home false
end

directory '/opt/tomcat' do
    action :create
    owner 'tomcat'
    group 'tomcat'
    mode '0755'
end

remote_file '/tmp/apache-tomcat-8.5.20.tar.gz' do
    source 'https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz'
    owner 'tomcat'
    group 'tomcat'
    mode '0755'
    action :create
    notifies :run, 'execute[extract_tomcat]', :immediately
end


execute 'extract_tomcat' do
    command 'tar xvf /tmp/apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'
    action :nothing
    notifies :run, 'execute[group_tomcat]', :immediately
end

execute 'group_tomcat' do
    command 'chgrp -R tomcat /opt/tomcat'
    action :nothing
    notifies :run, 'execute[permissions_tomcat]', :immediately
end

execute 'permissions_tomcat' do
    command 'chmod -R g+r /opt/tomcat/conf'
    action :nothing
    notifies :run, 'execute[permissions2_tomcat]', :immediately
end

execute 'permissions2_tomcat' do
    command 'chmod g+x /opt/tomcat/conf'
    action :nothing
    notifies :run, 'execute[owner_tomcat]', :immediately
end

execute 'owner_tomcat' do
    command 'chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/'
    action :nothing
    notifies :run, 'execute[owner_tomcat]', :immediately
end



file "/etc/systemd/system/tomcat.service' do
    action :create
    content '# Systemd unit file for tomcat
    [Unit]
    Description=Apache Tomcat Web Application Container
    After=syslog.target network.target
    
    [Service]
    Type=forking
    
    Environment=JAVA_HOME=/usr/lib/jvm/jre
    Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
    Environment=CATALINA_HOME=/opt/tomcat
    Environment=CATALINA_BASE=/opt/tomcat
    Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
    Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'
    
    ExecStart=/opt/tomcat/bin/startup.sh
    ExecStop=/bin/kill -15 $MAINPID
    
    User=tomcat
    Group=tomcat
    UMask=0007
    RestartSec=10
    Restart=always
    
    [Install]
    WantedBy=multi-user.target"
    notifies :run, 'execute[tomcat daemon reload]', :immediately
end

execute 'tomcat daemon reload' do
    command 'systemctl daemon-reload'
    action :nothing
end

service 'tomcat' do
    action [:enable, :start]
end