# init.pp
# Main class of macports
#
#
# Install/Update MacPorts on OS X
# Make sure:
#   1. Xcode and the Xcode Command Line Tools are installed
#     http://guide.macports.org/#installing.xcode
#   2. Agree to Xcode license in Terminal
#     sudo xcodebuild -license
#
#

class macports (
  $version     = $macports::params::version,
  $base_url    = $macports::params::base_url,
  $install_url = $macports::params::install_url,
) inherits macports::params {

  $pkg = "MacPorts-${version}-${::macosx_productversion_major}-${macports::params::codename}.pkg"

  $real_install_url = $install_url ? {
    undef   => "${base_url}/${$pkg}",
    default => $install_url,
  }

  validate_string($version)
  validate_string($real_install_url)

  if str2bool($::xcode_clt_installed) {
    package { $pkg:
      ensure   => installed,
      provider => pkgdmg,
      source   => $real_install_url,
    }
  } else {
    fail("The ${module_name} module requires Xcode Command Line Tools.")
  }

}
