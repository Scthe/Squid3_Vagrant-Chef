# copy aliases
template "/home/vagrant/.bash_aliases" do
  source ".bash_aliases"
  mode '0775'
  owner 'vagrant'
  action  :create
end

# copy squid conf
template "/etc/squid3/squid.conf" do
  source "squid.conf"
  mode '0775'
  owner 'vagrant'
end

# colorize prompt
# THE.BEST.THING.EVA
ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/home/vagrant/.bashrc")
    file.search_file_replace(/^.+force_color_prompt=yes$/, "force_color_prompt=yes")
    file.write_file
    #not_if “grep -q http://www.example.com /etc/hosts”
  end
end
