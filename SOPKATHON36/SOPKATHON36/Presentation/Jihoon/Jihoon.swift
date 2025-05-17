//
//  Jihoon.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/16/25.
//

import UIKit
import SnapKit
import Then

class MatchSuccessViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .black
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "친구 매칭에 성공했어요!"
        $0.font = .head2
        $0.textAlignment = .center
    }
    
    private let mainProfileImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 60
        $0.clipsToBounds = true
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "친구의 안심번호를 복사하여\n전화를 걸어주세요"
        $0.font = .head1
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private let laterLabel = UILabel().then {
        $0.text = "나중에 할래요"
        $0.font = .body2
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private let copyPhoneButton = UIButton().then {
        $0.setTitle("안심번호 복사하기", for: .normal)
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = .body2
        $0.setTitleColor(.black, for: .normal)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    // MARK: - Configure UI
    
    override func configure() {
        super.configure()
        
        addSubviews(
            backButton,
            titleLabel,
            mainProfileImageView,
            descriptionLabel,
            laterLabel,
            copyPhoneButton
        )
    }
    
    // MARK: - Layout
    
    override func setConstraints() {
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            $0.centerX.equalToSuperview()
        }
        
        mainProfileImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(120)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(mainProfileImageView.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        laterLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        copyPhoneButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(47)
        }
    }
    
    // MARK: - Setup Actions
    
    private func setupActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(laterLabelTapped))
        laterLabel.isUserInteractionEnabled = true
        laterLabel.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Actions
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func laterLabelTapped() {
        navigationController?.popViewController(animated: true)
    }
}

#Preview {
    MatchSuccessViewController()
}
