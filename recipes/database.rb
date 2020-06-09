bash 'apt-update' do
  code <<-EOH
    sudo apt update
  EOH
end
package 'mysql-server'

template '/home/vagrant/createdata.sql' do
  source 'createdata.sql.erb'
end

template '/home/vagrant/testserver.sql' do
  source 'testserver.sql.erb'
end

bash 'create_table' do
  user 'vagrant'
  # cwd::File.dirname(/home/vagrant)
  code <<-EOH
        cd "/home/vagrant"
        sudo mysql < createdata.sql
    EOH
end
