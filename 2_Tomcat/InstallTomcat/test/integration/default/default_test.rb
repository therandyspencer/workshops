# InSpec test for recipe InstallTomcat::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# rspencer - package was installed
describe package('java-1.8.0-openjdk-devel') do
  it { should be_installed }
end

# rspencer - verify user was created
describe user('tomcat') do
  it { should exist }
end

# rspencer - verify group was created
describe group('tomcat') do
  it { should exist }
end

# rspencer - verify directory was created and permissions were updated
describe directory('/opt/tomcat') do
  it { should exist }
  its('group') { should eq 'tomcat' }
  its('owner') { should eq 'tomcat' }
end

# rspencer - verify directory was unpacked correctly and permissions were updated
describe directory('/opt/tomcat/webapps') do
  it { should exist }
  its('group') { should eq 'tomcat' }
end

# rspencer - verify directory was unpacked correctly and permissions were updated
describe directory('/opt/tomcat/work') do
  it { should exist }
  its('group') { should eq 'tomcat' }
end

# rspencer - verify directory was unpacked correctly and permissions were updated
describe directory('/opt/tomcat/temp') do
  it { should exist }
  its('group') { should eq 'tomcat' }
end

# rspencer - verify directory was unpacked correctly and permissions were updated
describe directory('/opt/tomcat/logs') do
  it { should exist }
  its('group') { should eq 'tomcat' }
end

# rspencer - verify tomcat config file was created
describe file('/etc/systemd/system/tomcat.service') do
  it { should exist }
end

# rspencer - verify webpage is viewable
describe http('http://localhost:8080') do
  its('status') { should cmp 200 }
end
