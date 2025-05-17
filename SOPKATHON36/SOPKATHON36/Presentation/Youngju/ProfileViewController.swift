//
//  ProfileViewController.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class ProfileViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .white
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .white
    }
    
    // MARK: - UI Components
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then {
        $0.text = "미자 님, 만나서 반가워요.\n프로필을 등록해 주세요."
        $0.textColor = .gray900
        $0.font = .head2
        $0.numberOfLines = 0
    }
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "profile")
        $0.layer.cornerRadius = 80
        $0.clipsToBounds = true
        $0.backgroundColor = ColorSystem.Primary.light.withAlphaComponent(0.1)
    }
    
    private let nameView = ProfileNameView()
    
    private let personalityLabel = UILabel().then {
        $0.text = "한 줄 성격 소개"
        $0.textColor = .gray900
        $0.font = .body1
    }
    
    private let personalityDescriptionLabel = UILabel().then {
        $0.text = "한 줄로 본인의 성격을 표현해 주세요."
        $0.textColor = .gray600
        $0.font = .caption1
    }
    
    private let personalityField = ProfileTextFieldView()
    
    private let ageLabel = UILabel().then {
        $0.text = "나이"
        $0.textColor = .gray900
        $0.font = .body1
    }
    
    private let ageContainer = UIView()
    private let ageField = ProfileAgeView()
    private let ageSuffixLabel = UILabel().then {
        $0.text = "세"
        $0.textColor = .gray900
        $0.font = .body2
    }
    
    private let phoneLabel = UILabel().then {
        $0.text = "전화번호"
        $0.textColor = .gray900
        $0.font = .body1
    }
    
    private let phoneDescriptionLabel = UILabel().then {
        $0.text = "전화번호를 입력해주세요."
        $0.textColor = .gray600
        $0.font = .caption1
    }
    
    private let phoneField = ProfileTextFieldView()
    
    private let genderLabel = UILabel().then {
        $0.text = "성별"
        $0.textColor = .gray900
        $0.font = .body1
    }
    
    private let genderDescriptionLabel = UILabel().then {
        $0.text = "성별은 서비스 내에서 노출되지 않아요."
        $0.textColor = .gray600
        $0.font = .caption1
    }
    
    private let maleButton = UIButton().then {
        $0.setTitle("남자", for: .normal)
        $0.applyProfileStyle(.subButton)
        $0.roundCorners(cornerRadius: 14)
        $0.setTitleColor(.gray900, for: .normal)
    }
    
    private let femaleButton = UIButton().then {
        $0.setTitle("여자", for: .normal)
        $0.applyProfileStyle(.subButton)
        $0.roundCorners(cornerRadius: 14)
        $0.setTitleColor(.gray900, for: .normal)
    }
    
    private lazy var genderButtonStack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.distribution = .fillEqually
        $0.addArrangedSubview(maleButton)
        $0.addArrangedSubview(femaleButton)
    }
    
    private let residenceLabel = UILabel().then {
        $0.text = "거주 지역"
        $0.textColor = .gray900
        $0.font = .body1
    }
    
    private let residenceDropdown = DropdownButtonView()
    
    private let hobbyLabel = UILabel().then {
        $0.text = "취미"
        $0.textColor = .gray900
        $0.font = .body1
    }
    
    private let hobbyDescriptionLabel = UILabel().then {
        $0.text = "취미 기반으로 친구가 추천돼요. 가장 좋아하는 취미 1개만 선택해 주세요."
        $0.textColor = .gray600
        $0.font = .caption1
        $0.numberOfLines = 0
    }
    
    private let hobbyDropdown = DropdownButtonView()
    
    private let recommendFriendLabel = UILabel().then {
        $0.text = "추천 친구의 성별"
        $0.textColor = .gray900
        $0.font = .body1
    }
    
    private let sameGenderButton = UIButton().then {
        $0.setTitle("동성만 받고싶어요", for: .normal)
        $0.applyProfileStyle(.subButton)
        $0.roundCorners(cornerRadius: 14)
        $0.setTitleColor(.gray900, for: .normal)
    }
    
    private let anyGenderButton = UIButton().then {
        $0.setTitle("이성도 괜찮아요", for: .normal)
        $0.applyProfileStyle(.subButton)
        $0.roundCorners(cornerRadius: 14)
        $0.setTitleColor(.gray900, for: .normal)
    }
    
    private lazy var recommendGenderStack = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.distribution = .fillEqually
        $0.addArrangedSubview(sameGenderButton)
        $0.addArrangedSubview(anyGenderButton)
    }
    
    private let profileVisibilityLabel = UILabel().then {
        $0.text = "내 프로필을 오픈하시겠어요?"
        $0.textColor = .gray900
        $0.font = .body1
    }
    
    private let profileVisibilitySwitch = UISwitch().then {
        $0.onTintColor = ColorSystem.Primary.light
    }
    
    private let profileVisibilityDescriptionLabel = UILabel().then {
        $0.text = "나의 비슷한 관심사를 가진 친구에게 내 프로필이 전달돼요."
        $0.textColor = .gray600
        $0.font = .caption1
        $0.numberOfLines = 0
    }
    
    private let registerButton = UIButton().then {
        $0.setTitle("등록 완료", for: .normal)
        $0.backgroundColor = ColorSystem.Primary.light
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .body1
        $0.roundCorners(cornerRadius: 14)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        setupDropdowns()
        addTargets()
    }
    
    // MARK: - Setup
    
    private func setupInitialState() {
        personalityField.textField.placeholder = "한 줄로 본인의 성격을 알려주세요"
        phoneField.textField.placeholder = "01012345678"
        ageField.textField.placeholder = "00"
        
        ageField.textField.keyboardType = .numberPad
        phoneField.textField.keyboardType = .phonePad
        
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupDropdowns() {
        residenceDropdown.configure(
            placeholder: "거주 지역을 선택해주세요",
            options: ["포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시"]
        )
        
        residenceDropdown.onOptionSelected = { [weak self] selectedOption in
            print("선택된 지역: \(selectedOption)")
        }
        
        hobbyDropdown.configure(
            placeholder: "취미를 선택해주세요",
            options: ["걷기", "요리", "등산", "서예", "독서", "영화감상", "음악감상", "여행", "쇼핑", "게임", "운동", "요가", "명상", "사진찍기", "그림그리기", "수영", "자전거타기", "캘리그라피"]
        )
        
        hobbyDropdown.onOptionSelected = { [weak self] selectedOption in
            print("선택된 취미: \(selectedOption)")
        }
    }
    
    override func configure() {
        super.configure()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            logoImageView, welcomeLabel, profileImageView,
            nameView,
            personalityLabel, personalityDescriptionLabel, personalityField,
            ageLabel, ageContainer,
            phoneLabel, phoneDescriptionLabel, phoneField,
            genderLabel, genderDescriptionLabel, genderButtonStack,
            residenceLabel, residenceDropdown,
            hobbyLabel, hobbyDescriptionLabel, hobbyDropdown,
            recommendFriendLabel, recommendGenderStack,
            profileVisibilityLabel, profileVisibilitySwitch, profileVisibilityDescriptionLabel,
            registerButton
        )
        
        ageContainer.addSubviews(ageField, ageSuffixLabel)
    }
    
    override func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(160)
        }
        
        nameView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        personalityLabel.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(130)
            $0.leading.equalToSuperview().offset(20)
        }
        
        personalityDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(personalityLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        personalityField.snp.makeConstraints {
            $0.top.equalTo(personalityDescriptionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(personalityField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        ageContainer.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(40)
            $0.width.equalTo(100)
        }
        
        ageField.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(60)
        }
        
        ageSuffixLabel.snp.makeConstraints {
            $0.leading.equalTo(ageField.snp.trailing).offset(5)
            $0.centerY.equalTo(ageField)
        }
        
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(ageContainer.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        phoneDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        phoneField.snp.makeConstraints {
            $0.top.equalTo(phoneDescriptionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        genderLabel.snp.makeConstraints {
            $0.top.equalTo(phoneField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        genderDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(genderLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        genderButtonStack.snp.makeConstraints {
            $0.top.equalTo(genderDescriptionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        residenceLabel.snp.makeConstraints {
            $0.top.equalTo(genderButtonStack.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        residenceDropdown.snp.makeConstraints {
            $0.top.equalTo(residenceLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        hobbyLabel.snp.makeConstraints {
            $0.top.equalTo(residenceDropdown.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        hobbyDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(hobbyLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        hobbyDropdown.snp.makeConstraints {
            $0.top.equalTo(hobbyDescriptionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        recommendFriendLabel.snp.makeConstraints {
            $0.top.equalTo(hobbyDropdown.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        recommendGenderStack.snp.makeConstraints {
            $0.top.equalTo(recommendFriendLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        
        profileVisibilityLabel.snp.makeConstraints {
            $0.top.equalTo(recommendGenderStack.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        profileVisibilitySwitch.snp.makeConstraints {
            $0.centerY.equalTo(profileVisibilityLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        profileVisibilityDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(profileVisibilityLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(profileVisibilityDescriptionLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    private func addTargets() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        maleButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        sameGenderButton.addTarget(self, action: #selector(recommendGenderButtonTapped(_:)), for: .touchUpInside)
        anyGenderButton.addTarget(self, action: #selector(recommendGenderButtonTapped(_:)), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func registerButtonTapped() {
        let tabBarVC = TabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    @objc private func genderButtonTapped(_ sender: UIButton) {
        if sender == maleButton {
            maleButton.backgroundColor = ColorSystem.Primary.light.withAlphaComponent(0.1)
            maleButton.setTitleColor(.primaryLight, for: .normal)
            maleButton.layer.borderColor = ColorSystem.Primary.light.cgColor
            
            femaleButton.backgroundColor = .white
            femaleButton.setTitleColor(.gray900, for: .normal)
            femaleButton.layer.borderColor = UIColor.gray400.cgColor
        } else {
            femaleButton.backgroundColor = ColorSystem.Primary.light.withAlphaComponent(0.1)
            femaleButton.setTitleColor(.primaryLight, for: .normal)
            femaleButton.layer.borderColor = ColorSystem.Primary.light.cgColor
            
            maleButton.backgroundColor = .white
            maleButton.setTitleColor(.gray900, for: .normal)
            maleButton.layer.borderColor = UIColor.gray400.cgColor
        }
    }
    
    @objc private func recommendGenderButtonTapped(_ sender: UIButton) {
        if sender == sameGenderButton {
            sameGenderButton.backgroundColor = ColorSystem.Primary.light.withAlphaComponent(0.1)
            sameGenderButton.setTitleColor(.primaryLight, for: .normal)
            sameGenderButton.layer.borderColor = ColorSystem.Primary.light.cgColor
            
            anyGenderButton.backgroundColor = .white
            anyGenderButton.setTitleColor(.gray900, for: .normal)
            anyGenderButton.layer.borderColor = UIColor.gray400.cgColor
        } else {
            anyGenderButton.backgroundColor = ColorSystem.Primary.light.withAlphaComponent(0.1)
            anyGenderButton.setTitleColor(.primaryLight, for: .normal)
            anyGenderButton.layer.borderColor = ColorSystem.Primary.light.cgColor
            
            sameGenderButton.backgroundColor = .white
            sameGenderButton.setTitleColor(.gray900, for: .normal)
            sameGenderButton.layer.borderColor = UIColor.gray400.cgColor
        }
    }
}

#Preview {
    ProfileViewController()
}
