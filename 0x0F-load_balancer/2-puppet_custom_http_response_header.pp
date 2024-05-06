# Installing an Nginx server with custom HTTP header

exec { 'Update':
	provider => shell,
	command  => 'sudo apt-get update',
	path     => '/usr/bin',
}

exec { 'Nginx installation':
	provider => shell,
	command  => 'sudo apt-get -y install nginx',
	path     => '/usr/bin',
}

exec { 'Header':
	provider => shell,
	command  => 'sed -i "/index index\.html;/a add_header X-Served-By $(hostname);" /etc/nginx/sites-available/default',
	path     => ['/usr/bin', '/bin'],
	before   => Exec['Restart'],
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
