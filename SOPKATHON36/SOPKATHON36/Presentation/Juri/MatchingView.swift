//
//  MatchingView.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class MatchingView: UIView {
    
    var count = 1
    
    private let logoImage = UIImageView()
    
    private let titleLabel = UILabel()
    private let backgroundView = UIImageView()
    
    let cardView = MatchingCardView()
    
    let retryButton = UIButton()
    let matchingButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        logoImage.do {
            // TODO: 로고 이미지로 바꾸기
            $0.image = .home
        }
        titleLabel.do {
            $0.text = "오늘의 친구 추천이 도착했어요"
            $0.font = .head2
        }
        
        backgroundView.do {
            $0.image = .matchingBackground
        }
        
        cardView.do {
            $0.roundCorners(cornerRadius: 8)
//            $0.layer.addShadow(
//                color: .gray300,
//                alpha: <#T##Float#>,
//                x: <#T##CGFloat#>,
//                y: <#T##CGFloat#>,
//                blur: <#T##CGFloat#>,
//                spread: <#T##CGFloat#>
//            )
        }
        
        retryButton.do {
            var config = UIButton.Configuration.plain()
            let title = "다시 추천받기 \(count)/5"

            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .font: UIFont.body3,
                .foregroundColor: UIColor.primaryLight
            ]))
            
            config.background.backgroundColor = .white

            $0.configuration = config
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.primaryLight.cgColor
            $0.roundCorners(cornerRadius: 8)
        }
        
        matchingButton.do {
            var config = UIButton.Configuration.plain()
            let title = "매칭 수락하기"

            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .font: UIFont.body3,
                .foregroundColor: UIColor.white
            ]))
            
            config.background.backgroundColor = .primaryLight

            $0.configuration = config
            $0.roundCorners(cornerRadius: 8)
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(
            backgroundView,
            logoImage,
            titleLabel,
            cardView,
            retryButton,
            matchingButton
        )
    }
    
    private func setLayout() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57)
            $0.leading.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.leading.equalToSuperview().inset(16)
        }
        
        cardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(436)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(201)
        }
        
        retryButton.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(17)
            $0.width.equalTo(170)
            $0.height.equalTo(47)
        }
        
        matchingButton.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(20)
            $0.leading.equalTo(retryButton.snp.trailing).offset(3)
            $0.width.equalTo(170)
            $0.height.equalTo(47)
        }
    }
    
    func changeCount() {
        setButtonStyle()
    }
    
    private func setButtonStyle() {
        var config = UIButton.Configuration.plain()
        let title = "다시 추천받기 \(count)/5"

        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
            .font: UIFont.body3,
            .foregroundColor: UIColor.primaryLight
        ]))
        
        config.background.backgroundColor = .white

        retryButton.configuration = config
    }
}
