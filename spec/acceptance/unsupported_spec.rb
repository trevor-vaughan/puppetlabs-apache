require 'spec_helper_acceptance'

describe 'unsupported distributions and OSes', :if => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  it 'should fail' do
    pp = <<-EOS
      class { 'apache': }
     puppetlabs_apache::vhost { 'test.lan':
        docroot => '/var/www',
      }
    EOS
    expect(apply_manifest(pp, :expect_failures => true).stderr).to match(/unsupported/i)
  end
end
