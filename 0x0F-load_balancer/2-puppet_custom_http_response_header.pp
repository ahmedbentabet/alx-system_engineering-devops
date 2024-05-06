# Install and configure an Nginx server using Puppet instead of Bash

# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running
service { 'nginx':
	ensure => running,
	enable => true,
	require => Package['nginx'],
}

# Configure Nginx
file { '/var/www/html/index.html':
	content => 'Hello World!',
	mode    => '0644',
	require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
	content => "server {
		listen 80;
		root /var/www/html;
		index index.html;
		add_header X-Served-By $hostname;

		location / {
			try_files \$uri \$uri/ =404;
		}
	}",
	mode    => '0644',
	require => Package['nginx'],
	notify  => Service['nginx'],
}

file { '/etc/nginx/sites-enabled/default':
	ensure  => link,
	target  => '/etc/nginx/sites-available/default',
	require => File['/etc/nginx/sites-available/default'],
	notify  => Service['nginx'],
}
