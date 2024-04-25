# This Puppet manifest installs the Flask package version 2.1.0 and a compatible version of Werkzeug using pip3.
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package { 'Werkzeug':
  ensure   => '2.1.1', # Version compatible with Flask 2.1.0
  provider => 'pip3',
}
