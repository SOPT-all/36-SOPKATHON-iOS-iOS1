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
    
    // 임시
    let card = CardEntity.mock()
    
    var count = 1
    
    private let titleLabel = UILabel()
    private let profileImage = UIImageView()
    
    private let cardView = MatchingCardView()
    
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
        titleLabel.do {
            $0.text = "오늘의 친구 추천이 도착했어요"
        }
        
        profileImage.do {
            $0.image = .matching
            $0.clipsToBounds = true
            $0.layer.cornerRadius = $0.layer.bounds.width / 2
        }
        cardView.do {
            $0.dataBind(card)
            $0.roundCorners(cornerRadius: 8)
        }
        
        retryButton.do {
            $0.setTitle("다시 추천받기 \(count)/5", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .gray
        }
        
        matchingButton.do {
            $0.setTitle("매칭 수락하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .black
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(
            titleLabel,
            profileImage,
            cardView,
            retryButton,
            matchingButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.leading.equalToSuperview().inset(16)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(162)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(304)
        }
        
        cardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(427)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(216)
        }
        
        retryButton.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(17)
            $0.width.equalTo(170)
            $0.height.equalTo(47)
        }
        
        matchingButton.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(14)
            $0.leading.equalTo(retryButton.snp.trailing).offset(3)
            $0.width.equalTo(170)
            $0.height.equalTo(47)
        }
    }
    
    func changeCount() {
        retryButton.setTitle("다시 추천받기 \(count)/5", for: .normal)
    }
}
