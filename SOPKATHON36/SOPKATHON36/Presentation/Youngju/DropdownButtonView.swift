//
//  DropdownButton.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class DropdownButtonView: UIView {
    
    private let textField = UITextField().then {
        $0.borderStyle = .none
        $0.backgroundColor = .white
        $0.font = .body2
        $0.textColor = .black
        $0.isUserInteractionEnabled = false
        $0.placeholder = "취미를 선택해주세요"
    }
    
    private let arrowImageView = UIImageView().then {
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        $0.image = UIImage(systemName: "chevron.down", withConfiguration: config)
        $0.tintColor = .gray
        $0.contentMode = .scaleAspectFit
    }

    private let containerView = UIView().then {
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 28
        $0.backgroundColor = .white
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
        addSubview(containerView)
        containerView.addSubview(textField)
        containerView.addSubview(arrowImageView)
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.bottom.equalToSuperview().inset(12)
            $0.trailing.equalTo(arrowImageView.snp.leading).offset(-8)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
    }
}
