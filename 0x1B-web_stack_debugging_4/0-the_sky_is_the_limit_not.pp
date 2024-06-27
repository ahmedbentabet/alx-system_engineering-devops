# Increase the number of worker connections in Nginx
exec { 'fix-for-nginx':
  command => 'sed -i "s/15/4096/" /etc/nginx/nginx.conf',
  path    => '/usr/local/bin/:/bin/',
}

# Restart Nginx to apply changes
service { 'nginx':
  ensure    => 'running',
  subscribe => Exec['fix-for-nginx'],
}