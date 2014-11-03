# TODO clear logs here - just in case
# TODO wrtite wget here !
#execute "a sample command" do
#    command "touch /home/hello/sample.txt"
#    creates "/home/hello/sample.txt"
#end

# if some cmd does not work use sudo..

hierarchyId = 1 # [1,2,3,4]
node_name = node[:hostname].to_sym

hierarchy = node['hierarchy_def'][hierarchyId]
proxy_path = []
if hierarchy.has_key?(node_name)
	node_conf = hierarchy[node_name]
	proxy_path = node_conf[:proxy_path]
	if !proxy_path.kind_of?(Array)
		proxy_path = [proxy_path]
	end
end
log_dir = "/vagrant/logs/hierarchy#{hierarchyId}/#{node_name.to_s}"



# TODO write access logs to /vagrant/logs
#directory "/etc/profile.d" do
#  owner   "root"
#  mode    "0755"
#end

p '###################################'
p node # node[squid0]
p node_name
#p proxy_path.inspect
#p node.inspect
#p node['_hierarchy']
#p node['__hierarchy']
#p node['___hierarchy']
p '###################################'



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
  variables({
	 :proxy_path => proxy_path,
	 :hierarchyId => hierarchyId,
	 :node_name => node_name,
	 :log_dir => log_dir
  })
end

# copy squid conf to log dir
template log_dir+"/squid.conf" do
  source "squid.conf"
  mode '0775'
  owner 'vagrant'
  variables({
	 :proxy_path => proxy_path,
	 :hierarchyId => hierarchyId,
	 :node_name => node_name
  })
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


execute "kill squid3" do
    #command "sudo squid -k shutdown"
	command "sudo service squid3 stop"
end

execute "clear cache" do
    command "sudo rm -rf /var/spool/squid3/*"
end

execute "clear logs" do
    command "sudo rm -f #{log_dir}/*.log"
end

execute "start squid3" do
    command "sudo service squid3 start"
end
