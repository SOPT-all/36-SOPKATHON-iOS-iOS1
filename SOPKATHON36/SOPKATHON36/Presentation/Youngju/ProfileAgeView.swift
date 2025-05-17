//
//  ProfileAgeView.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class ProfileAgeView: UIView {
    
    
    let textField = UITextField().then {
        $0.font = UIFont.body2
        $0.textColor = .black
        $0.borderStyle = .none
        $0.clearButtonMode = .whileEditing
        $0.contentMode = .left
    }
    
    let refreshButton = UIButton().then {
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        $0.setImage(UIImage(systemName: "reset", withConfiguration: config), for: .normal)
    }
    
    private let underlineView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        [textField, refreshButton, underlineView].forEach { addSubview($0) }

        textField.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(refreshButton.snp.leading).offset(-8)
        }

        refreshButton.snp.makeConstraints {
            $0.centerY.equalTo(textField)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(24)
        }

        underlineView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }

    }
}


