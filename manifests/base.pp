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

}
