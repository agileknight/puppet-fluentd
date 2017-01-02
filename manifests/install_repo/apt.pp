##apt.pp

# Class: fluentd::install_repo::apt ()
#
#
class fluentd::install_repo::apt () {

    apt::source { 'treasure-data':
        location    => "http://packages.treasuredata.com/2/ubuntu/${::lsbdistcodename}",
        release     => "${::lsbdistcodename}",
        repos       => "contrib",
        include_src => false,
    }

    exec { "import gpg key Treasure Data":
        command => "/usr/bin/curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add -",
        #unless  => "/usr/bin/apt-key list | grep -q 'Treasure Data'", # Treasure Data also greps outdated keys
        notify  => Class['::apt::update'],
    }
}