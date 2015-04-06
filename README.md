# Automated Security Audit for Ubuntu Linux Systems

Serverspec tests are designed to allow testing the state of a series of remote hosts. The main idea is to express how the server should be setup, and it will test that the current-setup matches your expectations.

### General installation and test

    apt-get install ruby rubygems ruby-bundler

    mkdir spec-tests/

    cd spec-tests/

    vi spec-tests/Gemfile
      source 'https://rubygems.org'

      gem 'serverspec'
      gem 'rake'
    
    cd ~/spec-tests/
    bundle  install --path ./gems/
    ...

    bundle exec serverspec-init
      Select OS type:
      1) UN*X
      2) Windows

      Select number: 1

      Select a backend type:

      1) SSH
      2) Exec (local)

      Select number: 1

      Vagrant instance y/n: n
      Input target host name: server.org
       + spec/server.org/
       + spec/server.org/httpd_spec.rb


By default, it will create a test under ~/spec-test/spec/server.org/httpd_spec.rb

    require 'spec_helper'

    describe package('apache2') do
      it { should be_installed }
    end

    describe service('apache2') do
      it { should be_enabled   }
      it { should be_running   }
    end

    describe port(80) do
      it { should be_listening }
    end

In order to test run

    bundle exec rake spec
    /usr/bin/ruby1.8 -S rspec spec/server.org/httpd_spec.rb
    ...

    Finished in 1.63 seconds
    4 examples, 0 failures


### Running the audit

In order to execute tests for SSH, Nginx and Postregsql hardening rename or copy the directory server.org under spec/ directory whith the domain of the server you need to audit.


