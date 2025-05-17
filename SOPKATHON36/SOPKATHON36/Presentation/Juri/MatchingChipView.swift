//
//  MatchingChipView.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

import UIKit

final class MatchingChipView: UIView {
    
    private let icon = UIImageView()
    private let titleLabel = UILabel()
    
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
        self.backgroundColor = .white
        self.roundCorners(cornerRadius: 16)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.primaryLight.cgColor
        
        titleLabel.do {
            $0.font = .caption1
            $0.textColor = .primaryLight
        }
        
        icon.do {
            $0.image = .mingcuteMountain2Fill
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(icon, titleLabel)
    }
    
    private func setLayout() {
        icon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(133)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(icon.snp.trailing).offset(4)
        }
    }
    
    func dataBind() {
        titleLabel.text = "등산"
    }
}
