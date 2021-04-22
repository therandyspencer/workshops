#
# Cookbook:: TechScreen
# Recipe:: AddUser
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - install mongo
yum_package 'mongodb-org' do
  action :install
end

# rspencer - start mongo
service 'mongod' do
  action :start
end

# rspencer - start mongo on boot
service 'mongod' do
  action :enable
end
