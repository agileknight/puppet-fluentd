##apt.pp

# Class: fluentd::install_repo::apt ()
#
#
class fluentd::install_repo::apt () {

    apt::source { 'treasure-data':
        location     => "http://packages.treasuredata.com/2/ubuntu/trusty/",
        release      => "trusty",
        repos        => "contrib",
        architecture => 'amd64',
        key 		 => {
        	'id'	  => '0xea124b4372c1cd00',
        	'source'  => 'https://packages.treasuredata.com/GPG-KEY-td-agent',
        	'include' => {
        		'src' => false,
        	},
        },
        notify       => Exec['apt_update'],
    }
}
