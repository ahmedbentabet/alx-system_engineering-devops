# Puppet manifest to configure Nginx with custom HTTP header

exec { 'Update':
  provider => shell,
  command  => 'sudo apt-get update',
  before   => Exec['Nginx installation'],
}

exec { 'Nginx installation':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
  before   => Exec['Header'],
}

exec { 'Header':
  provider => shell,
  command  => 'sudo sed -i "s#index index.html;#index index.html;\n\tadd_header X-Served-By $(hostname);#" /etc/nginx/sites-available/default',
  before   => Exec['Restart'],
}

exec { 'Restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
