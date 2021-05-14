# InSpec test for recipe MongoDBRefactor::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# rspencer - if directory does not exist then verify mongo is installed correctly
describe directory('/var/lib/mongo') do
  it { should exist }
end

# rspencer - mongo should be running and enabled
describe service('mongod') do
  it { should be_enabled }
  it { should be_running }
end
