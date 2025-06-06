//
//  Constants.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 21/03/25.
//

import Foundation

struct Constants {
    static var suspiciousAppsPaths: [String] {
        [
            "/Applications/Cydia.app",
            "/Applications/RockApp.app",
            "/Applications/Icy.app",
            "/Applications/WinterBoard.app",
            "/Applications/SBSetttings.app",
            "/Applications/blackra1n.app",
            "/Applications/IntelliScreen.app",
            "/Applications/Snoop-itConfig.app",
            "/Applications/FakeCarrier.app",
            "/Applications/MxTube.app",
            "/Applications/SBSettings.app",
            "/Applications/Icy.app",
        ]
    }
    
    static var suspiciousSystemFilePaths: [String] {
        [
            "/private/var/lib/apt/",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/usr/sbin/sshd",
            "/etc/apt",
            "/usr/libexec/sftp-server",
            "/private/var/lib/cydia",
            "/private/var/tmp/cydia.log",
            "/usr/libexec/cydia/",
            "/usr/sbin/frida-server",
            "/usr/bin/cycript",
            "/usr/local/bin/cycript",
            "/usr/lib/libcycript.dylib",
            "/bin/sh",
            "/usr/libexec/sftp-server",
            "/usr/libexec/ssh-keysign",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt",
            "/usr/bin/ssh",
            "/bin.sh",
            "/var/checkra1n.dmg",
            "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
            "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
            "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
            "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
            "/etc/apt/sources.list.d/electra.list",
            "/etc/apt/sources.list.d/sileo.sources",
            "/.bootstrapped_electra",
            "/usr/lib/libjailbreak.dylib",
            "/jb/lzma",
            "/.cydia_no_stash",
            "/.installed_unc0ver",
            "/jb/offsets.plist",
            "/usr/share/jailbreak/injectme.plist",
            "/etc/apt/undecimus/undecimus.list",
            "/var/lib/dpkg/info/mobilesubstrate.md5sums",
            "/jb/jailbreakd.plist",
            "/jb/amfid_payload.dylib",
            "/jb/libjailbreak.dylib",
            "/usr/libexec/cydia/firmware.sh",
            "/var/lib/cydia",
            "/private/var/Users/",
            "/var/log/apt",
            "/private/var/stash",
            "/private/var/cache/apt/",
            "/private/var/log/syslog",
            "/private/var/mobile/Library/SBSettings/Themes",
            "/Library/MobileSubstrate/CydiaSubstrate.dylib"
        ]
    }
    
    static var suspiciousLibraries: [String] {
        [
            "frida", "frida-server", "libfrida-gadget", "libfrida", // Frida
            "libinjector", "libsubstitute", "libhooker", "libdyld", // Ferramentas de injeção
            "MobileSubstrate", "CydiaSubstrate", "substitute", "Cycript", "libcycript", // Substrate e Cycript
            "libtaschen", "libdlt", // Outras bibliotecas de hack
            "gdb", "lldb", "xcode", // Ferramentas de debugging
            "rootless", "libhooker", "com.apple.mobile.installation_proxy", "tweak", // Modificações no sistema
            "sslkill", "sslstrip", "mitmproxy", // Ferramentas de ataque à rede
            "AppSync", "iFile", "iCleaner", "iSSH", // Ferramentas para dispositivos **jailbroken**
            "cynject", "libcycript", "FridaGadget"
        ]
    }
}
