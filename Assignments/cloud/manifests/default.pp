case $::hostname {

  'appserver':{
    package{ 'nodejs':
       ensure => 'present',
       require => Exec['first']
      }
    package{ 'curl':
       ensure => 'installed',
       require => Exec['apt-get']
      }
    exec { 'apt-get':
       command => '/usr/bin/apt-get update -y'
      }
    exec { 'first':
      command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
      require => Exec['apt-get']
  }
 }

  'dbserver':{
    package { 'mysql-server':
    ensure => latest,
    }
  }
}
