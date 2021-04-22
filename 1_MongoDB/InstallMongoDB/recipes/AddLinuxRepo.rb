#
# Cookbook:: TechScreen
# Recipe:: AddRepo
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - add special repo for mongodb
yum_repository 'mongoDB' do
  baseurl 'https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/'
  gpgcheck true
  enabled true
  gpgkey 'https://www.mongodb.org/static/pgp/server-4.4.asc'
  action :create
end
