class nodejs ( $version, $logoutput = 'on_failure' ) {

  package { 'curl':
    ensure => present,
  }
  package { 'libssl-dev':
    ensure => present,
  }
  package { 'build-essential':
    ensure => present,
  }

  # use nave, yo
  exec { 'nave' :
    command     => "bash -c \"\$(curl -s 'https://raw.github.com/isaacs/nave/master/nave.sh') usemain $version \"",
    path        => [ "/usr/local/bin", "/bin" , "/usr/bin" ],
    require     => [ Package[ 'curl' ], Package[ 'libssl-dev' ], Package[ 'build-essential' ] ],
    environment => [ 'HOME=""', 'PREFIX=/usr/local/lib/node', 'NAVE_JOBS=1' ],
    logoutput   => $logoutput,
    # btw, this takes forever....
    timeout     => 0,
    unless      => "test \"v$version\" = \"\$(node -v)\""
  }

}

