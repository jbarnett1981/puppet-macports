# selfupdate.pp
#
# Periodically run port selfupdate
# to keep macports and the ports tree up to date
#
#

class macports::selfupdate (
  $update_period = $macports::params::update_period,
  $update_range  = $macports::params::update_range,
  $update_repeat = $macports::params::update_repeat,
) inherits macports::params {

  require ::macports

  validate_re($update_period, '^(hourly|daily|weekly|monthly|never)$')
  validate_string($update_range)
  validate_re("${update_repeat}", '^\d+$') # lint:ignore:only_variable_string

  schedule { 'macports_selfupdate':
    period => $update_period,
    range  => $update_range,
    repeat => $update_repeat,
  }

  exec { 'port selfupdate':
    path     => ['/opt/local/bin'],
    schedule => 'macports_selfupdate',
  }

}
