//

import Foundation

public extension UIDevice {
    var hasHapticEngine: Bool {
        guard let version = platform.split(separator: ",").first else { return false }
        
        return ["iPhone9", "iPhone10"].contains(version)
    }
    
    var hasSemiHapticEngine: Bool {
        guard let version = platform.split(separator: ",").first else { return false }
        
        return ["iPhone8"].contains(version)
    }
    
    var isIphoneX: Bool {
        return ["iPhone10,3", "iPhone10,6"].contains(platform)
    }
    
    var isInLowPowerMode: Bool { return ProcessInfo.processInfo.isLowPowerModeEnabled }
    
    var platform: String {
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine,
                                  count: Int(_SYS_NAMELEN)),
                      encoding: .ascii)?.trimmingCharacters(in: .controlCharacters) ?? ""
    }
    
}
