Squid3 exercises using Vagrant and Chef-solo
============================================

## Usage

#### Get it running

1. Install [VirtualBox]
1. Install [Vagrant]
1. Install [Vagrant omnibus plugin] `vagrant plugin install vagrant-omnibus`
1. Execute in project directory: `vagrant up`

By now You have 3 VMs running with ubuntu and squid3 installed. It may take a while when running the command for the first time as it needs to download the OS image.

#### Creating cache hierarchy ( assuming all is up and running)
1. Open [script] file
1. In [script] change **hierarchyId** ( in line 3) to one of: *1, 2, 3 or 4*
1. Execute in project directory: `vagrant provision`
1. Execute curl ( on **host machine**) with selected vm address as proxy f.e. `curl -x 192.168.56.101:3128 http://www.deepsloweasy.com/` or just run on of the scripts from [scripts] folder
1. Go to [logs] to view generated data f.e. [here] if You are interested in squid1's logs and configuration after running the 3rd hierarchy

#### Kill the VMs:

`
vagrant halt
`

You can also ssh into the machine: `vagrant ssh MACHINE_NAME`, where MACHINE_NAME is one of:
* squid0
* squid1
* squid2

Interested in hierarchy configuration?  [hierarchy configuration]

## VMs

|      | squid0         | squid1         | squid2          |
|------|----------------|----------------|-----------------|
| MAC  | 080000002101   | 080000002111   | 080000002121    |
| eth1 | 192.168.56.101<br/>080000002102 | 192.168.56.102<br/>080000002112 | 192.168.56.103<br/>080000002122  |


[VirtualBox]: https://www.virtualbox.org/
[Vagrant]: https://www.vagrantup.com/
[Vagrant omnibus plugin]: https://github.com/opscode/vagrant-omnibus
[script]: m_cookbooks/taskA/recipes/default.rb
[scripts]: scripts
[logs]: logs
[here]: logs/hierarchy3/squid1
[hierarchy configuration]: m_cookbooks/taskA/attributes/default.rb
