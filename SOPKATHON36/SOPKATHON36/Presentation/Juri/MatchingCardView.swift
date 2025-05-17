//
//  MatchingCardView.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

import UIKit

final class MatchingCardView: UIView {
    
    private let nameLabel = UILabel()
    private let locationLabel = UILabel()
    private lazy var divider1 = UIView()
    private let distanceLabel = UILabel()
    private lazy var divider2 = UIView()
    private let ageLabel = UILabel()
    
    private let chipView = MatchingChipView()
    
    private let informationBackgroundView = UIView()
    private let informationLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDivider() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray300
        return view
    }
    
    private func setStyle() {
        backgroundColor = .white
        
        divider1 = setDivider()
        divider2 = setDivider()
        
        nameLabel.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 22, weight: .semibold)
        }
        
        locationLabel.do {
            $0.textColor = .gray700
            $0.font = .caption1
        }
        
        distanceLabel.do {
            $0.textColor = .gray700
            $0.font = .caption1
        }
        
        ageLabel.do {
            $0.textColor = .gray700
            $0.font = .caption1
        }
        
        chipView.do {
            $0.dataBind()
        }
        
        informationBackgroundView.do {
            $0.backgroundColor = .gray100
            $0.roundCorners(cornerRadius: 8)
        }
        
        informationLabel.do {
            $0.textColor = .black
            $0.font = .body2
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(
            nameLabel,
            locationLabel,
            divider1,
            distanceLabel,
            divider2,
            ageLabel,
            chipView,
            informationBackgroundView
        )
        
        informationBackgroundView.addSubview(informationLabel)
    }
    
    private func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(18)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(18)
        }
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(locationLabel.snp.trailing).offset(8)
            $0.width.equalTo(1)
            $0.height.equalTo(16)
        }
        
        distanceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(divider1.snp.trailing).offset(10)
        }
        
        divider2.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(distanceLabel.snp.trailing).offset(8)
            $0.width.equalTo(1)
            $0.height.equalTo(16)
        }
        
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(divider2.snp.trailing).offset(10)
        }
        
        chipView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.height.equalTo(32)
        }
        
        informationBackgroundView.snp.makeConstraints {
            $0.top.equalTo(chipView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.height.equalTo(40)
        }
        
        informationLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(14)
        }
    }
    
    func dataBind(_ card: RecommendUserEntity) {
        self.nameLabel.text = card.name
        self.locationLabel.text = card.location
        self.distanceLabel.text = "\(card.distance)km"
        self.ageLabel.text = "\(card.age)세"
        self.informationLabel.text = card.information
    }
}

#Preview {
    MatchingView()
}
