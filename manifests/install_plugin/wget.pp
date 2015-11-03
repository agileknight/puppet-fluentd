define fluentd::install_plugin::wget (
    $ensure      = 'present',
    $plugin_name = $name,
    $url,
) {
  if $url == undef{
    fail('require url')
  }

  exec { "$plugin_name":
    command => "/usr/bin/wget -O '/etc/td-agent/plugin/${plugin_name}' '${url}'",
    creates => "/etc/td-agent/plugin/${plugin_name}",
    require => Package[$fluentd::package_name],
  }
}
