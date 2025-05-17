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
    private let fetchHobbyService: FetchHobby = MockFetchHobbyService()

    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let menuNavigationButton = UIButton().then {
        $0.setImage(.menuNavigation, for: .normal)
    }
    
    private let welcomeSubtitleLabel = UILabel().then {
        $0.text = "오직 (앱 이름)에서만 만날 수 있는"
        $0.font = .caption1
        $0.textColor = .black
    }
    
    private let welcomeTitleLabel = UILabel().then {
        $0.text = "같이 등산 갈 사람?"
        $0.font = .display2
        $0.textColor = .black
    }
    
    private let bannerCountLabel = UILabel().then {
        $0.text = "1 / 3"
        $0.font = .caption1
        $0.textColor = .black
        $0.textAlignment = .center
        $0.backgroundColor = .systemGray4
    }
    
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
    
    private let placeCollectionView = PlaceCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 180, height: 239)
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
    }
    
    // MARK: Function
    private func setAddTarget() {
        
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
    
}

// MARK: UI Settings
extension HomeViewController {
    private func setUpLayOuts() {
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        [menuNavigationButton,
         welcomeSubtitleLabel,
         welcomeTitleLabel,
         bannerCountLabel,
         collectionViewBackgroundView].forEach {
            contentView.addSubview($0)
        }

        [recommendTitleLabel,
         recommendSubTitleLabel,
         showMoreButton,
         placeCollectionView].forEach {
            collectionViewBackgroundView.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(762)
        }
        
        menuNavigationButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(24)
        }
        
        welcomeSubtitleLabel.snp.makeConstraints {
            $0.leading.equalTo(welcomeTitleLabel.snp.leading)
            $0.bottom.equalTo(welcomeTitleLabel.snp.top).offset(-6)
            $0.height.equalTo(20)
        }
        
        welcomeTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalTo(collectionViewBackgroundView.snp.top).offset(-30)
            $0.height.equalTo(33)
        }
        
        bannerCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(welcomeTitleLabel.snp.bottom)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.greaterThanOrEqualTo(48)
            $0.height.equalTo(20)
        }

        collectionViewBackgroundView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview().offset(339)
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
        
        placeCollectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(recommendSubTitleLabel.snp.bottom).offset(20)
            $0.height.equalTo(239)
        }
    }
}
