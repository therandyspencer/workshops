#
# Cookbook:: WORKSHOPS
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
# configure yum repo
yum_repository 'mongodb' do
    description 'MongoDB Repository'
    baseurl 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64'
    action :create
    gpgcheck false
    enabled true
end

# Install mongodb
package 'mongodb-org' do
    action :install

end

# Ensure the service is running
service 'mongod' do
    action [:start, :enable]
end