# macports.rb
# Custom facts for determining if macports
# and dependencies are installed

Facter.add(:xcode_clt_rcpt_bom) do
  confine :kernel => 'Darwin'
  setcode do
    case Facter.value(:macosx_productversion_major)
    when '10.8'  then File.join('', 'var', 'db', 'receipts', 'com.apple.pkg.DeveloperToolsCLI.bom')
    when '10.9'  then File.join('', 'var', 'db', 'receipts', 'com.apple.pkg.CLTools_Executables.bom')
    when '10.10' then File.join('', 'var', 'db', 'receipts', 'com.apple.pkg.CLTools_Executables.bom')
    else nil
    end
  end
end

Facter.add(:macports_rcpt_bom) do
  confine :kernel => 'Darwin'
  setcode do
    File.join('', 'var', 'db', 'receipts', 'org.macports.MacPorts.bom')
  end
end

Facter.add(:xcode_clt_installed) do
  confine :kernel => 'Darwin'
  setcode do
    File.file?(Facter.value(:xcode_clt_rcpt_bom).to_s)
  end
end

Facter.add(:macports_installed) do
  confine :kernel => 'Darwin'
  setcode do
    File.file?(Facter.value(:macports_rcpt_bom).to_s)
  end
end
