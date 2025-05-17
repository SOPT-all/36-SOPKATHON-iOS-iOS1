//
//  ProfileView.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class ProfileView: UIView {
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .left
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "미자 님, 만나서 반가워요.\n프로필을 등록해 주세요."
        $0.textColor = .black
        $0.font = UIFont.head2
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "profile")
        $0.layer.cornerRadius = 80
        $0.clipsToBounds = true
        $0.tintColor = .gray
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
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(profileImageView)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(160)
        }
    }
}
