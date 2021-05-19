#
# Cookbook:: InstallTomcat
# Recipe:: AddPackage
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - install OpenJDK package
case node['platform']
when 'redhat', 'centos'
  package %w(java-1.8.0-openjdk-devel)
when 'ubuntu', 'debian'
  apt_update
  package %w(openjdk-11-jdk)
end
