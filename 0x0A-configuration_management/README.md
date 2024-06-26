# Project: 0x0A. Configuration management

## Resources

#### Read or watch:

* [Intro to Configuration Management](https://intranet.alxswe.com/rltoken/GL30hu-aRcKzPOvK8JO-Bg)
* [Puppet resource type: file](https://intranet.alxswe.com/rltoken/WON0M4DNRabf88KAG_pDUA)
* [Puppet's Declarative Language: Modeling Instead of Scripting](https://intranet.alxswe.com/rltoken/0V2fBdafkfKPMxA1umea3Q)
* [Puppet lint](https://intranet.alxswe.com/rltoken/CRUMeEMdcX-UtbWsUM9xLQ)
* [Puppet emacs mode](https://intranet.alxswe.com/rltoken/MzHXCntAkPzOqMnI6_rpWQ)
## Tasks

| Task | File |
| ---- | ---- |
| 0. Create a file | [0-create_a_file.pp](./0-create_a_file.pp) |
| 1. Install a package | [1-install_a_package.pp](./1-install_a_package.pp) |
| 2. Execute a command | [2-execute_a_command.pp](./2-execute_a_command.pp) |

## Note on Versioning
Your Ubuntu 20.04 VM should have Puppet 5.5 preinstalled.

### Install puppet
```bash
# Install Ruby and Puppet dependencies
$ apt-get install -y ruby=1:2.7+1 --allow-downgrades
$ apt-get install -y ruby-augeas
$ apt-get install -y ruby-shadow
$ apt-get install -y puppet

# Note: You do not need to attempt to upgrade versions.
# This project is simply a set of tasks to familiarize you with the basic level syntax,
# which is virtually identical in newer versions of Puppet.
```

[Puppet 5 Docs](https://www.puppet.com/docs/puppet/5.5/puppet_index.html)

### Install puppet-lint
```bash
$ gem install puppet-lint
```
