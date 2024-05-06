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
    listen 80;
    server_name localhost;

    # Custom HTTP header
    add_header X-Served-By ${hostname};

    location / {
        root /var/www/html;
        index index.html index.htm;
    }
}",
  notify  => Service['nginx'],  # Notify Nginx service to restart when the file changes
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
}
