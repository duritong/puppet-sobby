class sobby::base {
    package{ [ 'sobby', 'obby', 'net6' ]:
        ensure => installed,
    }

    sobby::instance{'sobby': port => 6522 }

    service{'sobby':
        ensure => running,
        enable => true,
        hasstatus => true,
        require => [ Package['sobby'], Package['obby'], Package['net6'] ],
    }

    file{'/opt/bin/sobby_archive.sh':
        source => "puppet:///modules/sobby/scripts/sobby_archive.sh",
        owner => root, group => 0, mode => 0700;
    }
    file{'/etc/cron.d/sobby_archive.cron':
      content => "*/5 * * * * root /opt/bin/sobby_archive.sh\n",
      owner => root, group => 0, mode => 0644;
    }
}
