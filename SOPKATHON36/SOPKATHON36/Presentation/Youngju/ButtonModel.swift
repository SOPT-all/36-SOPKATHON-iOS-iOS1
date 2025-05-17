//
//  ButtonModel.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit

extension UIButton {

    enum ProfileStyle {
        case mainButton
        case subButton
        
    }
    
    func applyProfileStyle(_ style: ProfileStyle) {
        switch style {
        case .mainButton:
            self.do {
                $0.backgroundColor = .white
                $0.setTitleColor(.black, for: .normal)
                $0.titleLabel?.font = .body2
                $0.clipsToBounds = true
            }
        case .subButton:
            self.do {
                $0.backgroundColor = .white
                $0.setTitleColor(.black, for: .normal)
                $0.titleLabel?.font = .body2
                $0.clipsToBounds = true
                $0.layer.borderWidth = 1
            }
        }
    }
}
