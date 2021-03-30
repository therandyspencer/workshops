#
# Cookbook:: WORKSHOPS
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
# configure yum repo
yum_repository 'mongodb' do
    description 'MongoDB Repository'
    baseurl 'https://repo.mongodb.org/yum/redhat/7/mongodb-org/'
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