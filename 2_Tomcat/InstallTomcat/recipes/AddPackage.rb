#
# Cookbook:: InstallTomcat
# Recipe:: AddPackage
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - install OpenJDK package
yum_package 'java-1.8.0-openjdk-devel' do
  action :install
end

# rspencer - install wget package
yum_package 'wget' do
  action :install
end
