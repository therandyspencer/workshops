# InstallMongoDB

This cookbook will install MongoDB on a centos/RHEL 7 machine. The important files are noted below.

- recipes/AddLinuxRepo.rb
  - This file will add the MongoDB repo
- recipes/InstallMongodb.rb
  - This file will install MongoDB, start the service, and enable it to start on boot
- Policyfile.rb
  - This file contains the list of recipes to run in the run_list line
- kitchen.yml
  - This file gives the platforms available and gives the path to the inspec test file
- test/integration/default/default_test.rb
  - This file contains the tests to verify the recipes ran successfully
