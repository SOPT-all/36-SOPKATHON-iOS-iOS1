//
//  ViewController.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/16/25.
//

import SnapKit
import Then
import UIKit
import SwiftUI

class ViewController: BaseViewController {

    private let helloLabel = UILabel().then {
        $0.text = "안뇽"
        $0.textColor = .black
        $0.font = UIFont.display1_r_34
        $0.textAlignment = .center
    }
    
    private let subLabel = UILabel().then {
        $0.text = "앞으로 잘해보자"
        $0.textColor = .black
        $0.font = UIFont.caption1_r_13
        $0.textAlignment = .center
    }
    
    override func configure() {
        super.configure()
        addSubviews(helloLabel, subLabel)
    }
    
    override func setConstraints() {
        helloLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(helloLabel.snp.bottom).offset(4)
        }
    }
}

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }

    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
#endif
