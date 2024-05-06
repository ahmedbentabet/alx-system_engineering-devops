# Installing an Nginx server with custom HTTP header

exec { 'Update':
  provider => shell,
  command  => 'apt-get update',
  path     => '/usr/bin',
}

exec { 'Nginx installation':
  provider => shell,
  command  => 'apt-get -y install nginx',
  path     => '/usr/bin',
}

file_line { 'add HTTP header':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'add_header X-Served-By $hostname;'
}

exec { 'Restart':
  provider => shell,
  command  => 'service nginx restart',
  path     => '/usr/sbin:/usr/bin:/sbin:/bin',
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx']
}
