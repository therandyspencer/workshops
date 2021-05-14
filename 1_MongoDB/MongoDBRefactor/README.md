# MongoDBRefactor

This cookbook will install MongoDB using a cookbook from the Supermarket. The important files are noted below.

- metadata.rb
  - This file gives the name of the supermaket cookbok
- recipes\default.rb
  - This file tells what recipes from the cookbook should be run
- kitchen.yml
  - This file lists the platform that the cookbook works on
- test\integration\default
  - This file makes sure mongodb is installed and running
