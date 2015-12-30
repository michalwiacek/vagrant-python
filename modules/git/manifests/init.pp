class git{
    include git::install
}

class git::install{
    package { 'git:':
        ensure => present
    }
}

class git::keys {
	file { "/home/vagrant/.ssh":
		ensure => directory,
		owner => 'vagrant',
		group => 'vagrant',
		mode => 0600,
	}

	# Configure key to be automatically used for GitHub
	file { "/home/vagrant/.ssh/config":
		ensure => present,
		source => "puppet:///modules/git/config",
		owner => 'vagrant',
		group => 'vagrant',
		mode => 0600,
		require => File['/home/vagrant/.ssh'],

	}

	# Add GitHub to known hosts to avoid prompt
	file { "/home/vagrant/.ssh/known_hosts":
		ensure => present,
		source => "puppet:///modules/git/known_hosts",
		owner => 'vagrant',
		group => 'vagrant',
		mode => 0600,
		require => File['/home/vagrant/.ssh'],
	}
}
