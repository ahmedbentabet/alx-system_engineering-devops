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

exec {'HTTP header':
	command => 'sed -i "25i\	add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
	provider => 'shell'
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
