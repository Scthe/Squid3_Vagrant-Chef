default['_hierarchy']['id'] = 'default'

default['hierarchy_def'][1] = {
	:squid1 => {
		#:ip => '192.168.56.102',
		:proxy_path => {
			:type => :parent,
			:hostname => '192.168.56.101',
			:proxy_port => 3128,
			:icp_port => 3130
		}
	},
	:squid2 => {
		#:ip => '192.168.56.103',
		:proxy_path =>{
			:type => :parent,
			:hostname => '192.168.56.101',
			:proxy_port => 3128,
			:icp_port => 3130
		}
		# TODO cmd => [ 'http://www.androidcentral.com/']
	}
}

default['hierarchy_def'][2] = {
	:squid0 => {
		#:ip => '192.168.56.101',
		:proxy_path => [{
			:type => :sibling,
			:hostname => '192.168.56.102',
			:proxy_port => 3128,
			:icp_port => 3130
		},
		{
			:type => :parent,
			:hostname => '192.168.56.103',
			:proxy_port => 3128,
			:icp_port => 3130
		}]
	},
	:squid1 => {
		#:ip => '192.168.56.102',
		:proxy_path => [{
			:type => :sibling,
			:hostname => '192.168.56.101',
			:proxy_port => 3128,
			:icp_port => 3130
		},
		{
			:type => :parent,
			:hostname => '192.168.56.103',
			:proxy_port => 3128,
			:icp_port => 3130
		}]
	},
	:squid2 => {
		#:ip => '192.168.56.103',
		:proxy_path => [{
			:type => :sibling,
			:hostname => '192.168.56.101',
			:proxy_port => 3128,
			:icp_port => 3130
		},
		{
			:type => :parent,
			:hostname => '192.168.56.102',
			:proxy_port => 3128,
			:icp_port => 3130
		}]
	},
}

default['hierarchy_def'][3] = {
	:squid2 => {
		#:ip => '192.168.56.103',
		:proxy_path =>[{
			:type => :parent,
			:hostname => '192.168.56.101',
			:proxy_port => 3128,
			:icp_port => 3130
		},
		{
			:type => :parent,
			:hostname => '192.168.56.102',
			:proxy_port => 3128,
			:icp_port => 3130
		}]
	}
}

default['hierarchy_def'][4] = {
	:squid0 => {
		#:ip => '192.168.56.101',
		:proxy_path => {
			:type => :sibling,
			:hostname => '192.168.56.102',
			:proxy_port => 3128,
			:icp_port => 3130
		}
	},
	:squid1 => {
		#:ip => '192.168.56.102',
		:proxy_path => {
			:type => :sibling,
			:hostname => '192.168.56.101',
			:proxy_port => 3128,
			:icp_port => 3130
		}
	},
	:squid2 => {
		#:ip => '192.168.56.103',
		:proxy_path => {
			:type => :parent,
			:hostname => '192.168.56.102',
			:proxy_port => 3128,
			:icp_port => 3130
		}
	},
}