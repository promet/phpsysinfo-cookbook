# phpsysinfo-cookbook cookbook

This installs a few PHP scripts and a GitHub Project (https://github.com/rk4an/phpsysinfo) to provide PHP developers working with a Vagrantbox a bit of information.

# Requirements

Install the Vagrant Berkshelf plugin

  $ vagrant plugin install vagrant-berkshelf

# Usage

In your project Berksfile add:

  $ cookbook "phpsysinfo", git: "https://github.com/gregpalmier/phpsysinfo-cookbook.git"

# Recipes

Default - Install some PHP tools
- phpinfo
- PHP APC Stats
- PHP memcache stats
- phpsysinfo (<https://github.com/rk4an/phpsysinfo>)

# Author
- Greg Palmier (<gregpalmier@gmail.com>)
