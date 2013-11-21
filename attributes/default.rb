case node['platform_family']
when 'rhel', 'fedora'
  default['php']['packages'] = %w[php-xml]
when 'ubuntu', 'debian'
when 'freebsd', 'arch'
end
