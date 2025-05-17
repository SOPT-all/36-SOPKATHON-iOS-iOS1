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
    static let display1 = UIFont.pretendard(weight: .regular, size: 34)
    static let display2 = UIFont.pretendard(weight: .regular, size: 28)
    
    // MARK: - Head
    static let head1 = UIFont.pretendard(weight: .semiBold, size: 22)
    static let head2 = UIFont.pretendard(weight: .medium, size: 20)
    static let head3 = UIFont.pretendard(weight: .medium, size: 18)
        
    // MARK: - Body
    static let body1 = UIFont.pretendard(weight: .regular, size: 17)
    static let body2 = UIFont.pretendard(weight: .regular, size: 15)
        
    // MARK: - Caption
    static let caption1 = UIFont.pretendard(weight: .regular, size: 13)
    
    // MARK: - Memo
    static let memo = UIFont.pretendard(weight: .regular, size: 11)
}
