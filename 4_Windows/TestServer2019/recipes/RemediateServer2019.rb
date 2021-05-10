#
# Cookbook:: TestServer2019
# Recipe:: RemediateServer2019
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rspencer - Only the administrators group should be able to login locally
windows_user_privilege 'Allow log on locally' do
  privilege 'SeInteractiveLogonRight'
  users          ['BUILTIN\Administrators']
  action         :set
end

# rspencer - Only administrators and remote desktop users should be able to login remotely
windows_user_privilege 'Remote interactive logon' do
  privilege 'SeRemoteInteractiveLogonRight'
  users          ['BUILTIN\Administrators', 'BUILTIN\Remote Desktop Users']
  action         :set
end

# rspencer - The 'Accounts:Administrator account status' should be disabled
windows_security_policy 'EnableAdminAccount' do
  secvalue '0'
  action :set
end

# rspencer - The 'Interactive logon: do not require ctrl+alt+del' setting should be disabled
registry_key 'HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'DisableCAD',
    type: :dword,
    data: 0,
  }]
  action :create
end

# rspencer - The 'Enable Windows NTP client' setting should be enabled
registry_key 'HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient' do
  values [{
    name: 'Enabled',
    type: :dword,
    data: 1,
  }]
  action :create
end

# rspencer - The 'Enable Windows NTP server' setting should be disabled
registry_key 'HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer' do
  values [{
    name: 'Enabled',
    type: :dword,
    data: 0,
  }]
  action :create
end
