//
//  UIStackView+.swift
//
//  Created by 이지훈 on 6/30/24.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init(frame: .zero)
        self.axis = axis
    }
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}