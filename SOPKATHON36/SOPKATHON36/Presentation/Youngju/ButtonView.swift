//
//  ButtonView.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class ButtonView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.text = "성별"
        $0.textColor = .black
        $0.font = .body1
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    private let maleButton = UIButton().then {
        $0.setTitle("남자", for: .normal)
        $0.applyProfileStyle(.subButton)
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.roundCorners(cornerRadius: 17)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray400.cgColor
    }
    
    private let femaleButton = UIButton().then {
        $0.setTitle("여자", for: .normal)
        $0.applyProfileStyle(.subButton)
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.roundCorners(cornerRadius: 17)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray400.cgColor
    }
    
    private lazy var genderStackView = UIStackView(arrangedSubviews: [maleButton, femaleButton]).then {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.alignment = .fill
        $0.distribution = .fillEqually
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
        addSubview(titleLabel)
        addSubview(genderStackView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        genderStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(56)
        }
    }
}


