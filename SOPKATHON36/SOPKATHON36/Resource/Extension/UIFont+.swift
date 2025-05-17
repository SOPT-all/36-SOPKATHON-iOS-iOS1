//
//  UIFont+.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/17/25.
//

import UIKit

// MARK: - 폰트 이름 상수화
extension UIFont {
    enum Pretendard: String {
        case semiBold = "Pretendard-SemiBold"
        case medium = "Pretendard-Medium"
        case regular = "Pretendard-Regular"
    }
        
    /// 폰트가 존재하지 않는경우 기본 폰트
    static func pretendard(weight: Pretendard, size: CGFloat) -> UIFont {
        return UIFont(name: weight.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    // MARK: - Display
    static let display1_r_34 = UIFont.pretendard(weight: .regular, size: 34)
    static let display2_r_28 = UIFont.pretendard(weight: .regular, size: 28)
    
    // MARK: - Head
    static let head1_sb_22 = UIFont.pretendard(weight: .semiBold, size: 22)
    static let head2_m_20 = UIFont.pretendard(weight: .medium, size: 20)
    static let head3_m_18 = UIFont.pretendard(weight: .medium, size: 18)
        
    // MARK: - Body
    static let body1_r_17 = UIFont.pretendard(weight: .regular, size: 17)
    static let body2_r_15 = UIFont.pretendard(weight: .regular, size: 15)
        
    // MARK: - Caption
    static let caption1_r_13 = UIFont.pretendard(weight: .regular, size: 13)
    
    // MARK: - Memo
    static let micro1_r_11 = UIFont.pretendard(weight: .regular, size: 11)
}
