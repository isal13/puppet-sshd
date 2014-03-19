require 'puppetlabs_spec_helper/module_spec_helper'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))
module_path = File.expand_path(File.join(fixture_path, 'modules'))

RSpec.configure do |c|
  c.default_facts = {
    :kernel => 'Linux',
    :operatingsystem => 'CentOS',
    :operatingsystemrelease => '6.4',
    :lsbmajdistrelease => '6',
    :osfamily => 'RedHat',
    :architecture => 'x86_64',
  }

  c.hiera_config = 'spec/fixtures/hiera.yaml'

  c.before(:all) do
    data = YAML.load_file(c.hiera_config)
    data[:yaml][:datadir] = File.join(module_path, 'hieradata')
    File.open(c.hiera_config, 'w') do |f|
      f.write data.to_yaml
    end
  end
end
