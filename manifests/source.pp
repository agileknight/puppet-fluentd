# == definition fluentd::source
define fluentd::source (
  $ensure   = present,
  $priority = 50,
  $config   = {},
  $filter	= {},
) {
  fluentd::configfile { "source-${name}":
    ensure   => $ensure,
    content  => template( 'fluentd/source.erb' ),
    priority => $priority,
  }
}
