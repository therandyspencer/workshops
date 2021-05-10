# TestServer2019

This cookbook will test settings on Windows Server 2019. The important files are noted below.

- recipes/RemediateServer2019.rb
  - This file will update all settings that InSpec will test for.
- Policyfile.rb
  - This file contains the list of recipes to run in the run_list line
  - There are two run_list options. The default run_list will only run InSpec tests, no settings will be changed. The second run_list will update all settings so that the InSpec tests pass.
- kitchen.yml
  - This file gives the platforms available and gives the path to the inspec test file
- test/integration/default/default_test.rb
  - This file contains the tests to verify Server 2019 is configured correctly..
