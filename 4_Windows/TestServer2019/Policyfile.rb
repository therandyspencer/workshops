# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'TestServer2019'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
# rspencer - The first run_list will allow the InSpec tests to find what is misconfigured.
#            The second run_list will apply the settings and then run the InSpec tests.
# run_list 'TestServer2019::default'
run_list 'TestServer2019::RemediateServer2019'

# Specify a custom source for a single cookbook:
cookbook 'TestServer2019', path: '.'
