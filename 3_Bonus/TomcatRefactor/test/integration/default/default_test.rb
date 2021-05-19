# InSpec test for recipe TomcatRefactor::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# rspencer - package was installed
describe file('/usr/bin/java') do
  it { should exist }
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
end

# rspencer - verify tomcat config file was created
describe file('/etc/systemd/system/tomcat.service') do
  it { should exist }
end

# rspencer - verify webpage is viewable
describe http('http://localhost:8080') do
  its('status') { should cmp 200 }
end
