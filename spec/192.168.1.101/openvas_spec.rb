require 'spec_helper'


describe package('openvas-administrator'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe package('openvas-cli'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe package('openvas-manager'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe package('openvas-scanner'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe port(9390) do
  it { should be_listening }
end

describe port(9391) do
  it { should be_listening }
end

describe port(9392) do
  it { should be_listening }
end

describe port(9393) do
  it { should be_listening }
end
