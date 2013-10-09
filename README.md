# phpsysinfo-cookbook cookbook

This installs a few PHP scripts and a GitHub Project (https://github.com/rk4an/phpsysinfo) to provide PHP developers working with a Vagrantbox a bit of information.

# Requirements

Install Vagrant 1.2.x from the [Vagrant downloads page](http://downloads.vagrantup.com/)

Install the Vagrant Berkshelf plugin:

````
  $ vagrant plugin install vagrant-berkshelf
````

Install Berkshelf (http://berkshelf.com/):

````
  $ gem install berkshelf
````

# Usage

In your project Berksfile add:

````
cookbook "phpsysinfo", git: "https://github.com/gregpalmier/phpsysinfo-cookbook.git"
````

In your project Vagrantfile add:

````
chef.run_list = [
  "recipe[phpsysinfo::default]"
]
````

OR

````
chef.add_recipe "phpsysinfo::default"
````

Once cloned, run:

````
$ berks install
````

# Recipes

Default - Install some PHP tools
- phpinfo
- PHP APC Stats
- PHP memcache stats
- phpsysinfo (<https://github.com/rk4an/phpsysinfo>)

# Author
- Greg Palmier (<gregpalmier@gmail.com>)
