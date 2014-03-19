require 'spec_helper'

describe 'sshd' do

    let(:service_name) { 'sshd' }
    let(:package_name) { 'openssh-server' }

    describe 'it should be installed enabled running' do
        it { should contain_package('openssh-server').with_ensure('installed') }
        it { should contain_service('sshd').with_enable('true') }
        it { should contain_service('sshd').with_ensure('running') }
    end

    describe 'it should lay down sshd_config' do
        it { should contain_file('/etc/ssh/sshd_config').with(
            'ensure' => 'present',
            'mode'   => '0644',
            'owner'  => 'root',
            'group'  => 'root', )
        }
    end

    describe 'sshd_config should contain' do
        it { should contain_file('/etc/ssh/sshd_config').with_content(/$*Protocol 2/) }
        it { should contain_file('/etc/ssh/sshd_config').with_content(/$*Port 22/) }
        it { should contain_file('/etc/ssh/sshd_config').with_content(/$*PermitRootLogin no/) }
        it { should contain_file('/etc/ssh/sshd_config').with_content(/$*UseDNS no/) }
    end

    describe 'it should contain sftp if sftp is true' do
        let(:params) { { :sftp => true } }
        it { should contain_file('/etc/ssh/sshd_config').with_content(/$*Subsystem   sftp    internal-sftp/) }
    end




end
