# Install Chef Workstation
if $(rpm -qa | grep chef-workstation);
then
  echo 'Using installed version of Chef Workstation'
else
  yum install -y https://packages.chef.io/files/stable/chef-workstation/21.3.346/el/8/chef-workstation-21.3.346-1.el7.x86_64.rpm
fi
# Run exercise 1
sudo chef-client --local-mode recipes/mongodb.rb
# Run exercise 2
sudo chef-client --local-mode recipes/tomcat.rb
## Test tomcat
### Adding a sleep before test for time to startup
sleep 30
curl http://localhost:8080
# Run exercise 3 - bonus
echo 'Skipping exercise 3, it is getting late and had a broken link from instructions.'
# Run exercise 4 - But not really since it is Windows.
echo "Workshops 1-3 are now complete."
echo "Please review instructions and execute on your Windows 2019 server."
