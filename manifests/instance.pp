define sobby::instance(
  $ensure = present,
  $user = 'sobby',
  $manage_user = true,
  $password = 'absent',
  $port
){
  include ::sobby
  $sobby_instance_name = $name

  if ($user != 'sobby') and $manage_user {
    $real_user = "sobby_${name}"
    user::managed{$real_user:
      ensure => $ensure,
      name_comment => 'Sobby instance user',
      gid => '123',
      manage_group => false,
      homedir => '/var/sobby',
      managehome => false,
      shell => '/sbin/nologin',
      before => File["/etc/sobby/${name}.conf"],
    }
  } else {
    $real_user = 'sobby'
  }

  file{"/etc/sobby/${name}.conf":
    content => template('sobby/config.erb'), 
    ensure => $ensure,
    require => Package['sobby'],
    notify => Service['sobby'],
    owner => $real_user, group => sobby, mode => 0640;
  }
}
