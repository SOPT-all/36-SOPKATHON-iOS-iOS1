//
//  ColorSystem.swift
//  SOPKATHON36
//
//  Created by 이지훈 on 5/18/25.
//

import UIKit

enum ColorSystem {
    // MARK: - Primary Colors
    enum Primary {
        static let light = UIColor(hex: "#FF3742")
        static let normal = UIColor(hex: "#CC0B1C")
        static let strong = UIColor(hex: "#840013")
        static let heavy = UIColor(hex: "#410506")
    }
    
    // MARK: - Line Colors
    enum Line {
        static let normal = UIColor(hex: "#D8D8D8")
        static let neutral = UIColor(hex: "#E1E1E1")
        static let alternative = UIColor(hex: "#FAFAFA")
    }
    
    // MARK: - Gray Scale
    enum Gray {
        static let gray900 = UIColor(hex: "#212121")
        static let gray800 = UIColor(hex: "#424242")
        static let gray700 = UIColor(hex: "#616161")
        static let gray600 = UIColor(hex: "#757575")
        static let gray500 = UIColor(hex: "#9E9E9E")
        static let gray400 = UIColor(hex: "#BDBDBD")
        static let gray300 = UIColor(hex: "#E0E0E0")
        static let gray200 = UIColor(hex: "#EEEEEE")
        static let gray100 = UIColor(hex: "#F5F5F5")
        static let gray50 = UIColor(hex: "#FAFAFA")
    }
    
    // MARK: - System Colors
    enum System {
        static let error = UIColor(hex: "#FF3B30")
        static let success = UIColor(hex: "#34C759")
        static let info = UIColor(hex: "#007AFF")
        static let warning = UIColor(hex: "#FF9F0A")
    }
}

// UIColor extension to create colors from hex values
extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }
}

// MARK: - Asset Catalog Color Extension
extension UIColor {
    // Primary Colors
    static let primaryLight = ColorSystem.Primary.light
    static let primaryNormal = ColorSystem.Primary.normal
    static let primaryStrong = ColorSystem.Primary.strong
    static let primaryHeavy = ColorSystem.Primary.heavy
    
    // Common Colors
    static let commonWhite = ColorSystem.Common.white
    static let commonBlack = ColorSystem.Common.black
    
    // Background Colors
    static let backgroundNormal = ColorSystem.Background.normal
    
    // Line Colors
    static let lineNormal = ColorSystem.Line.normal
    static let lineNeutral = ColorSystem.Line.neutral
    static let lineAlternative = ColorSystem.Line.alternative
    
    // Gray Scale
    static let gray900 = ColorSystem.Gray.gray900
    static let gray800 = ColorSystem.Gray.gray800
    static let gray700 = ColorSystem.Gray.gray700
    static let gray600 = ColorSystem.Gray.gray600
    static let gray500 = ColorSystem.Gray.gray500
    static let gray400 = ColorSystem.Gray.gray400
    static let gray300 = ColorSystem.Gray.gray300
    static let gray200 = ColorSystem.Gray.gray200
    static let gray100 = ColorSystem.Gray.gray100
    static let gray50 = ColorSystem.Gray.gray50
    
    // System Colors
    static let systemError = ColorSystem.System.error
    static let systemSuccess = ColorSystem.System.success
    static let systemInfo = ColorSystem.System.info
    static let systemWarning = ColorSystem.System.warning
}
