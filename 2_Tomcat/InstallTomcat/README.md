# InstallTomcatV2

This cookbook will install tomcat on a centos/RHEL 7 machine. The important files are noted below.

- recipes/AddPackage.rb
  - This file will add wget and OpenJDK
- recipes/AddLinuxUser.rb
  - This file will create the tomcat user, its home directory, and the tomcat group
- recipes/WgetFile.rb
  - This file pulls the installer, unpacks it, and sets several permissions
- recipes/CreateConfigFile.rb
  - This file creates the config file and restart the tomcat service
- recipes/PrepareService.rb
  - This file ensures that tomcat is running and starts at boot
- Policyfile.rb
  - This file contains the list of recipes to run in the run_list line
- kitchen.yml
  - This file gives the platforms available and gives the path to the inspec test file
- test/integration/default/default_test.rb
  - This file contains the tests to verify the recipes ran successfully.

- CHANGES FOR V2
- Removed recipes/WgetFile.rb
- Created recipes/PullRemoteFile
- Updated Policyfile.rb
- Removed extra inspec tests used for development
