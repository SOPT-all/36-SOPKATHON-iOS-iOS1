//
//  ProfileTextField.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class ProfileNameView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.text = "이름"
        $0.font = UIFont.head1
        $0.textColor = .black
    }
    
    let textField = UITextField().then {
        $0.font = UIFont.body2
        $0.textColor = .black
        $0.text = "익명의 시원한 미자"
        $0.borderStyle = .none
        $0.clearButtonMode = .whileEditing
    }
    
    let refreshButton = UIButton().then {
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        $0.setImage(UIImage(systemName: "reset", withConfiguration: config), for: .normal)
    }
    
    private let underlineView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "'오미자' 서비스 내에서는 모든 사람들을 ‘미자’라고 불러요."
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.textColor = .gray
        $0.numberOfLines = 0
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
        [titleLabel, textField, refreshButton, underlineView, descriptionLabel].forEach { addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
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

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

