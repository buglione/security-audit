require 'spec_helper'

describe 'SSH owner, group and permissions' do

  describe file('/etc/ssh') do
    it { should be_directory }
  end

  describe file('/etc/ssh') do
    it { should be_owned_by 'root' }
  end

  describe file('/etc/ssh') do
    it { should be_mode 755 }
  end

  describe file('/etc/ssh/sshd_config') do
    it { should be_owned_by 'root' }
  end

  describe file('/etc/ssh/sshd_config') do
    it { should be_mode 600 }
  end

  describe file('/etc/ssh/ssh_config') do
    it { should be_mode 644 }
  end

end
