class python {
	include python::install
}

class python::install {
    package { [ "python", "python-dev", "python-pip"]:
        ensure => present,
    }
	
	exec { "virtualenv":
		command => "/usr/bin/sudo pip install virtualenv",
		require => Package["python-dev", "python-pip"],
    }
	
	exec { "virtualenvwrapper":
		command => "/usr/bin/sudo pip install virtualenvwrapper",
		require => Exec["virtualenv"],
	}
}
