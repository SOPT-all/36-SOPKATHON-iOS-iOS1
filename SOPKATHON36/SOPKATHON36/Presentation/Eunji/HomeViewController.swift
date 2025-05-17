//
//  HomeViewController.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - Properties

    
    // MARK: - UI Components
    private let collectionViewBackgroundView = UIView().then {
        $0.backgroundColor = .systemGray4
    }
    
    private let recommendTitleLabel = UILabel().then {
        $0.text = "등산을 좋아하시네요!"
        $0.font = .head2
        $0.textColor = .black
    }
    
    private let recommendSubTitleLabel = UILabel().then {
        $0.text = "경상북도에서 등산으로 유명한 장소를 추천드릴게요"
        $0.font = .caption1
        $0.textColor = .black
    }
    
    private let showMoreButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        let title = "자세히 보기"

        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
            .font: UIFont.micro,
            .foregroundColor: UIColor.black
        ]))
        
        config.image = UIImage(named: "rightArrow")
        config.imagePlacement = .trailing
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        config.background.backgroundColor = .clear
        config.cornerStyle = .fixed

        $0.configuration = config
        $0.sizeToFit()
    }


    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLayOuts()
        setUpConstraints()
    }
    
    // MARK: Function
    private func setAddTarget() {
        
    }
}

// MARK: - @objc
extension HomeViewController {
    
}

// MARK: UI Settings
extension HomeViewController {
    private func setUpLayOuts() {
        view.backgroundColor = .white

        [collectionViewBackgroundView
        ].forEach {
            view.addSubview($0)
        }
        
        [recommendTitleLabel,
         recommendSubTitleLabel,
         showMoreButton
        ].forEach {
            collectionViewBackgroundView.addSubview($0)
        }

    }

    private func setUpConstraints() {
        collectionViewBackgroundView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(379)
        }
        
        recommendTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(30)
        }
        
        recommendSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(recommendTitleLabel.snp.bottom).offset(-2)
            $0.leading.equalTo(recommendTitleLabel.snp.leading)
            $0.height.equalTo(20)
        }
        
        showMoreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(recommendTitleLabel.snp.top)
            $0.width.greaterThanOrEqualTo(55)
            $0.height.equalTo(15)
        }
    }
}
