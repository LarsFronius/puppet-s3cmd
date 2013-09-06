define s3cmd::config (
  $aws_access_key_id,
  $aws_secret_access_key,
  $aws_region = 'US',
  $owner,
  $group,
) {
  $path = $name

  include s3cmd

  file { $path:
    content => template('s3cmd/s3cfg.erb'),
    owner   => $owner,
    group   => $group,
    mode    => '0400',
    require => Package['s3cmd']
  }
}
