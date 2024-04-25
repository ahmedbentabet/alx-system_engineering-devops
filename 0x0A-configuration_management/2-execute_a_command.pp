# This Puppet manifest kills a process named 'killmenow' using the pkill command.
exec { 'kill_killmenow':
  command => 'pkill -f killmenow',
  path    => '/usr/bin:/bin',
}
