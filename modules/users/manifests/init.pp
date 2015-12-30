class users {

	user { 'vagrant':
	  ensure           => 'present',
	}	
    
	file { '/home/vagrant':
		ensure => directory,
		owner => 'vagrant',
		group => 'vagrant',
		mode => 755,
		source => 'puppet:///modules/users/vagrant',
		recurse => remote,
		require => User['vagrant'],
	}

}