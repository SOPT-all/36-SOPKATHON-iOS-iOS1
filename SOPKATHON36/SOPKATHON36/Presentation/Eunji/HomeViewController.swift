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
    private let fetchHobbyService: FetchHobby = DefaultFetchHobby()
    private let bannerImageArray: [UIImage] = [
        .bannerMainVisual1,
        .bannerMainVisual2,
        .bannerMainVisual3
    ]

    private var currentBannerIndex = 0
    private var bannerTimer: Timer?
    
    // MARK: - UI Components
    private let logoImageView = UIImageView().then {
        $0.image = .logo
    }

    private let menuNavigationButton = UIButton().then {
        $0.setImage(.menuNavigation, for: .normal)
    }
    
    private let bannerImageView = UIImageView().then {
        $0.image = .bannerMainVisual1
        $0.contentMode = .scaleAspectFill
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
            .foregroundColor: UIColor.gray500
        ]))
        
        config.image = UIImage(named: "rightArrow")
        config.imagePlacement = .trailing
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        config.background.backgroundColor = .clear
        config.cornerStyle = .fixed

        $0.configuration = config
        $0.sizeToFit()
    }
    
    private let placeCollectionView = PlaceCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 180, height: 225)
        layout.minimumLineSpacing = 8
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLayOuts()
        setUpConstraints()
        fetchHobbyData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        startBannerTimer()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopBannerTimer()
    }
    
    // MARK: Function
    private func startBannerTimer() {
        bannerTimer = Timer.scheduledTimer(timeInterval: 2.0,
                                           target: self,
                                           selector: #selector(updateBannerImage),
                                           userInfo: nil,
                                           repeats: true)
    }

    private func stopBannerTimer() {
        bannerTimer?.invalidate()
        bannerTimer = nil
    }
    
    private func fetchHobbyData() {
        Task {
            do {
                let result = try await fetchHobbyService.fetchHobby(data: "")
                placeCollectionView.update(result)
            } catch {
                print("데이터 로드 실패: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - @objc
extension HomeViewController {
    @objc private func updateBannerImage() {
        currentBannerIndex = (currentBannerIndex + 1) % bannerImageArray.count
        UIView.transition(with: bannerImageView,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
                              self.bannerImageView.image = self.bannerImageArray[self.currentBannerIndex]
                          },
                          completion: nil)
    }
}

// MARK: UI Settings
extension HomeViewController {
    private func setUpLayOuts() {
        view.backgroundColor = .white

        [logoImageView,
         menuNavigationButton,
         bannerImageView,
         recommendTitleLabel,
         recommendSubTitleLabel,
         showMoreButton,
         placeCollectionView
        ].forEach {
            view.addSubview($0)
        }

    }
    
    private func setUpConstraints() {
        logoImageView.snp.makeConstraints {
            $0.centerY.equalTo(menuNavigationButton.snp.centerY)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(24)
            $0.width.greaterThanOrEqualTo(81)
        }
        
        menuNavigationButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(57)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(24)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(290)
        }
        
        recommendTitleLabel.snp.makeConstraints {
            $0.top.equalTo(bannerImageView.snp.bottom).offset(31)
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
        
        placeCollectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(recommendSubTitleLabel.snp.bottom).offset(16)
            $0.height.equalTo(237)
        }
    }
}
