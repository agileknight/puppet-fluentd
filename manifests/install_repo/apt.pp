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
        	'id'	  => 'C901622B5EC4AF820C38AB861093DB45A12E206F',
        	'source'  => 'https://packages.treasuredata.com/GPG-KEY-td-agent',
        	'include' => {
        		'src' => false,
        	},
        },
        notify       => Exec['apt_update'],
    }
}
