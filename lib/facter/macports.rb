# macports.rb
# Custom facts for determining if macports
# and dependencies are installed

Facter.add(:xcode_clt_installed) do
  confine :kernel => 'Darwin'
  setcode do
    case Facter.value(:macosx_productversion_major)
    when '10.8'  then Facter::Util::Resolution.exec("/usr/sbin/pkgutil --packages | grep -c com.apple.pkg.DeveloperToolsCLI.bom")
    else Facter::Util::Resolution.exec("/usr/sbin/pkgutil --packages | grep -c com.apple.pkg.CLTools_Executables")
    end
  end
end

Facter.add(:macports_installed) do
  confine :kernel => 'Darwin'
  setcode do
    Facter::Util::Resolution.exec("/usr/sbin/pkgutil --packages | grep -c org.macports.MacPorts.bom")
  end
end