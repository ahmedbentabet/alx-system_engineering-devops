# Puppet manifest to configure Nginx with custom HTTP header

# Ensure Nginx is installed
package { 'nginx':
  ensure => installed,
}

# Define the custom HTTP header in the Nginx configuration file
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "\
  server {
      add_header X-Served-By ${hostname};
  }",
  notify  => Service['nginx'],  # Notify Nginx service to restart when the file changes
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
}
