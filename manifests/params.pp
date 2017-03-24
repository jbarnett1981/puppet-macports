# params.pp
# Set up macports parameters defaults etc.
#

class macports::params {

  $version     = '2.4.1'
  $base_url    = 'https://distfiles.macports.org/MacPorts'
  $install_url = undef

  # init.pp
  if ($::osfamily == 'Darwin') {
    if versioncmp($::macosx_productversion_major, '10.8') == 0 {
      $codename = 'MountainLion'
    } elsif versioncmp($::macosx_productversion_major, '10.9') == 0 {
      $codename = 'Mavericks'
    } elsif versioncmp($::macosx_productversion_major, '10.10') == 0 {
      $codename = 'Yosemite'
    } elsif versioncmp($::macosx_productversion_major, '10.11') == 0 {
      $codename = 'ElCapitan'
    } elsif versioncmp($::macosx_productversion_major, '10.12') == 0 {
      $codename = 'Sierra'
    } else {
      fail("The ${module_name} module only supports 'Mountain Lion', 'Mavericks', 'Yosemite', 'ElCapitan', 'Sierra‎'.")
    }
  } else {
    fail("The ${module_name} module is not supported on a ${::osfamily} based system.")
  }

  # selfupdate.pp
  $update_period = weekly
  $update_range  = '2 - 4'
  $update_repeat = 1

}