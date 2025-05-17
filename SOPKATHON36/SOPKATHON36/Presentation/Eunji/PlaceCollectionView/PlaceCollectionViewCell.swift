//
//  PlaceCollectionViewCell.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/18/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class PlaceCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "PlaceCollectionViewCell"
    private var itemRow: Int?
    
    // MARK: - UI Components
    private let placeImageView = UIImageView()
    
    private let backgroundColorView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let placeNameLabel = UILabel().then {
        $0.font = .body3
        $0.textColor = .black
    }
    
    private let placeDetailLabel = UILabel().then {
        $0.font = .micro
        $0.textColor = .black
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayOuts()
        setUpConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    func dataBind(_ itemData: PlaceModel, itemRow: Int) {
        if let url = URL(string: itemData.placeImage) {
            let processor = DownsamplingImageProcessor(size: placeImageView.bounds.size)
            let options: KingfisherOptionsInfo = [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ]
            
            placeImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholderImage"),
                options: options,
                completionHandler: { result in
                    switch result {
                    case .success:
                        print("이미지 로딩 성공")
                    case .failure(let error):
                        print("이미지 로딩 실패: \(error.localizedDescription)")
                    }
                }
            )
        }
        
        placeNameLabel.text = itemData.placeName
        placeDetailLabel.text = itemData.placeDetail
        self.itemRow = itemRow
    }
}

// MARK: UI Settings
extension PlaceCollectionViewCell {
    private func setUpLayOuts() {
        [placeImageView, backgroundColorView].forEach {
            self.addSubview($0)
        }
        
        [placeNameLabel, placeDetailLabel].forEach {
            backgroundColorView.addSubview($0)
        }
    }

    private func setUpConstraints() {
        placeImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(166)
        }
        
        backgroundColorView.snp.makeConstraints {
            $0.top.equalTo(placeImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(73)
        }
        
        placeNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(21)
        }
        
        placeDetailLabel.snp.makeConstraints {
            $0.top.equalTo(placeNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(placeNameLabel.snp.leading)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
}
