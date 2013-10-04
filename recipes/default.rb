#
# Cookbook Name:: phpsysinfo
# Recipe:: default
#
# Copyright 2013, gregpalmier
#
# All rights reserved - Redistribute
#
include_recipe 'git'
include_recipe 'php'
include_recipe 'php::module_apc'
include_recipe 'apache2'
include_recipe 'apache2::mod_php5'

bash "create_sitedir" do
 user "root"
 code <<-EOH
 mkdir -p #{node[:apache][:docroot_dir]}/phpinfo
 EOH
end

# A basic phpinfo.php file
cookbook_file "#{node[:apache][:docroot_dir]}/phpinfo/phpinfo.php" do
  source "phpinfo.php"
  mode 0644
  owner "root"
  action :create
end

# Clone the phpsysinfo repo from GitHub and put it under the
# default apache vhost location (under an assumption here, yes)
git "#{node[:apache][:docroot_dir]}/phpinfo/phpsysinfo" do
   repository "https://github.com/rk4an/phpsysinfo.git"
   user "root"
   action :checkout
end

# Create the phpsysinfo.ini file (defaults, or it would
# be a templated thing with attributes)
cookbook_file "#{node[:apache][:docroot_dir]}/phpinfo/phpsysinfo/phpsysinfo.ini" do
  source "phpsysinfo.ini"
  mode 0644
  owner "root"
  action :create
end

# Update the index.html file to include a link to the 
# php info pages
cookbook_file "#{node[:apache][:docroot_dir]}/index.html" do
  source "index.html"
  mode 0644
  owner "root"
  action :create
end

cookbook_file "#{node[:apache][:docroot_dir]}/phpinfo/phpinfo_memcache.php" do
  source "phpinfo_memcache.php"
  mode 0644
  owner "root"
  action :create
end

cookbook_file "#{node[:apache][:docroot_dir]}/phpinfo/phpinfo_apc.php" do
  source "phpinfo_apc.php"
  mode 0644
  owner "root"
  action :create
end

#case node[:platform]
#  when "ubuntu","debian"
#    template "#{node[:apache][:dir]}/conf.d/phpsysinfo.conf" do
#    source "phpsysinfo.conf.erb"
#    owner "root"
#    group 0
#    mode 00644
#    notifies :restart, "service[apache2]"
#  end
#  when "centos","redhat"
#    template "#{node[:apache][:dir]}/conf.d/phpsysinfo.conf" do
#    source "phpsysinfo.conf.erb"
#    owner "root"
#    group 0
#    mode 00644
#    notifies :restart, "service[httpd]"
#  end
#end
