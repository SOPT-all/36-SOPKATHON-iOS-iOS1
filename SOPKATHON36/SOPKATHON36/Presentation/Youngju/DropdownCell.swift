//
//  DropdownCell.swift
//  SOPKATHON36
//
//  Created by 이지훈 on 5/18/25.
//

import UIKit

class DropdownCell: UITableViewCell {
    
    private let optionLabel = UILabel().then {
        $0.font = .body2
        $0.textColor = .gray900
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    private func setupCell() {
        selectionStyle = .none
        backgroundColor = .white
        
        contentView.addSubview(optionLabel)
        
        optionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(with option: String) {
        optionLabel.text = option
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            backgroundColor = ColorSystem.Primary.light.withAlphaComponent(0.1)
        } else {
            backgroundColor = .white
        }
    }
}
