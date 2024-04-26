# Puppet manifest to configure SSH client client to use the private key and disable password authentication

# Ensure password authentication is disabled
file_line { 'Turn off passwd auth':
  ensure => present,        # Path to the SSH client configuration file
  line   => 'PasswordAuthentication no',  # Configuration line to add
  match  => '^#?PasswordAuthentication',  # Regex to match existing configuration (commented or not)
  path   => '/etc/ssh/ssh_config',                      # Ensure the line is present in the file
}

# Ensure identity file is declared in SSH client configuration
file_line { 'Declare identity file':
  ensure => present,         # Path to the SSH client configuration file for the user
  line   => 'IdentityFile ~/.ssh/school',  # Configuration line to add
  match  => '^#?IdentityFile',             # Regex to match existing configuration (commented or not)
  path   => '/etc/ssh/ssh_config',                       # Ensure the line is present in the file
}
