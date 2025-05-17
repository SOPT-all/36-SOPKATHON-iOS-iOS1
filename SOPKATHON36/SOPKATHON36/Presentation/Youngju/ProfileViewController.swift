//
//  ProfileViewController.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then
import SwiftUI

final class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    private let profileNameView = ProfileNameView()
    
    private let introduceLabel = UILabel().then {
        $0.text = "한 줄 성격 소개"
        $0.textColor = .black
        $0.font = .body1
    }
    
    private let introduceTextFieldView = ProfileTextFieldView()
    
    private let ageLabel = UILabel().then {
        $0.text = "나이"
        $0.textColor = .black
        $0.font = .body1
    }
    
    private let ageTextFieldView = ProfileTextFieldView()
    
    private let buttonview = ButtonView()
    
    private let dropdownButtonview = DropdownButtonView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(profileView)
        view.addSubview(profileNameView)
        view.addSubview(introduceLabel)
        view.addSubview(introduceTextFieldView)
        view.addSubview(ageLabel)
        view.addSubview(ageTextFieldView)
        view.addSubview(buttonview)
        view.addSubview(dropdownButtonview)
        
        profileView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        profileNameView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(282)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.greaterThanOrEqualTo(100)
        }
        
        introduceLabel.snp.makeConstraints {
            $0.top.equalTo(profileNameView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }

        introduceTextFieldView.snp.makeConstraints {
            $0.top.equalTo(introduceLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(introduceTextFieldView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        ageTextFieldView.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(100)
        }
        
        buttonview.snp.makeConstraints {
            $0.top.equalTo(ageTextFieldView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        dropdownButtonview.snp.makeConstraints {
            $0.top.equalTo(buttonview.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
    }
}

#Preview {
    ProfileViewController()
}
