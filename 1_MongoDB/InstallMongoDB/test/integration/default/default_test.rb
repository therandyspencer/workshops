# InSpec test for recipe InstallMongoDB::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# unless os.windows?
#  # This is an example test, replace with your own test.
#  describe user('root'), :skip do
#    it { should exist }
#  end
# end

# This is an example test, replace it with your own test.
# describe port(80), :skip do
#  it { should_not be_listening }
# end

# rspencer - if repo file does not exist then verify repo was added correctly
describe file('/etc/yum.repos.d/mongoDB.repo') do
  it { should exist }
end

# rspencer - if directory does not exist then verify mongo is installed correctly
describe directory('/var/lib/mongo') do
  it { should exist }
end

# rspencer - mongo should be running and enabled
describe service('mongod') do
  it { should be_enabled }
  it { should be_running }
end
