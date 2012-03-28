class nodejs ( $version ) {

  package { 'curl':
    ensure => present,
  }
  package { 'libssl-dev':
    ensure => present,
  }

  # use nave, yo
  exec { 'nave' :
    command => "bash -c \"\$(curl -s 'https://raw.github.com/isaacs/nave/master/nave.sh') usemain $version \"",
    path     => [ "/usr/local/bin", "/bin" , "/usr/bin" ],
    require => Package[ 'curl' ],
    environment => [ 'HOME=""', 'PREFIX=/usr/local/lib/node' ],
  }

}

