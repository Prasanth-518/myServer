# InSpec test for recipe Database::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(3306) do
  it { should be_listening }
end

describe command 'sudo mysql < /home/vagrant/testserver.sql' do
  its(:stdout) { should match(/Recipe Success/) }
end
