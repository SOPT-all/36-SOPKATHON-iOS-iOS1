//
//  ProfileTextFieldView.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class ProfileTextFieldView: UIView {
    
    let textField = UITextField().then {
        $0.font = UIFont.body2
        $0.textColor = .black
        $0.borderStyle = .none
        $0.clearButtonMode = .never
        $0.isUserInteractionEnabled = true
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
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
        setupGesture()
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
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.addGestureRecognizer(tapGesture)
        
        let fieldTapGesture = UITapGestureRecognizer(target: self, action: #selector(fieldTapped))
        textField.addGestureRecognizer(fieldTapGesture)
        
        refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchUpInside)
    }
    
    @objc private func viewTapped() {
        print("ProfileTextFieldView 탭됨")
        textField.becomeFirstResponder()
    }
    
    @objc private func fieldTapped() {
        print("TextField 직접 탭됨")
        textField.becomeFirstResponder()
    }
    
    @objc private func refreshButtonTapped() {
        textField.text = ""
        textField.becomeFirstResponder()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if textField.frame.contains(point) {
            print("hitTest: TextField 영역 탭됨")
            return textField
        }
        
        return super.hitTest(point, with: event)
    }
}
