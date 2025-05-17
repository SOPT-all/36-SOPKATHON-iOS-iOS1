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
    
    private let placeNameLabel = UILabel().then {
        $0.font = .body3
        $0.textColor = .black
    }
    
    private let placeDetailLabel = UILabel().then {
        $0.font = .micro
        $0.textColor = .gray800
        $0.numberOfLines = 0
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayOuts()
        setUpConstraints()
        setUpShadow()

        self.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true

        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    func dataBind(_ itemData: HobbyModel, itemRow: Int) {
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
        [placeImageView, placeNameLabel, placeDetailLabel].forEach {
            self.addSubview($0)
        }
    }

    private func setUpConstraints() {
        placeImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(152)
        }
        
        placeNameLabel.snp.makeConstraints {
            $0.top.equalTo(placeImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(21)
        }
        
        placeDetailLabel.snp.makeConstraints {
            $0.top.equalTo(placeNameLabel.snp.bottom)
            $0.leading.equalTo(placeNameLabel.snp.leading)
            $0.trailing.equalToSuperview().offset(-13)
            $0.height.equalTo(30)
        }
    }
    
    private func setUpShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 6
        layer.masksToBounds = false
    }

}
