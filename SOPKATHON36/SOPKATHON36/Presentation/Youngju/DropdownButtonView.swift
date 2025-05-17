//
//  DropdownButton.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/18/25.
//

import UIKit
import SnapKit
import Then

final class DropdownButtonView: UIView {
        
    var options: [String] = []
    var selectedOption: String? {
        didSet {
            textField.text = selectedOption
            if selectedOption != nil {
                textField.textColor = .gray900
            }
        }
    }
    
    var onOptionSelected: ((String) -> Void)?
    
    private var isDropdownVisible = false
        
    let textField = UITextField().then {
        $0.borderStyle = .none
        $0.backgroundColor = .white
        $0.font = .body2
        $0.textColor = .gray500
        $0.isUserInteractionEnabled = false
    }
    
    private let arrowImageView = UIImageView().then {
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        $0.image = UIImage(systemName: "chevron.down", withConfiguration: config)
        $0.tintColor = .gray
        $0.contentMode = .scaleAspectFit
    }

    private let containerView = UIView().then {
        $0.layer.borderColor = UIColor.gray400.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 28
        $0.backgroundColor = .white
    }
    
    private lazy var dropdownTableView = UITableView().then {
        $0.layer.cornerRadius = 14
        $0.layer.borderColor = UIColor.gray300.cgColor
        $0.layer.borderWidth = 1
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.rowHeight = 50
        $0.isScrollEnabled = true
        $0.bounces = false
        $0.register(DropdownCell.self, forCellReuseIdentifier: "DropdownCell")
        $0.delegate = self
        $0.dataSource = self
        $0.isHidden = true
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupTapGesture()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
        setupTapGesture()
    }
    
    private func setupLayout() {
        addSubview(containerView)
        containerView.addSubview(textField)
        containerView.addSubview(arrowImageView)
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(56)
        }
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.bottom.equalToSuperview().inset(12)
            $0.trailing.equalTo(arrowImageView.snp.leading).offset(-8)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        containerView.addGestureRecognizer(tapGesture)
    }
        
    @objc private func handleTap() {
        toggleDropdown()
    }
    
    func toggleDropdown() {
        if let window = window, !options.isEmpty {
            if isDropdownVisible {
                hideDropdown()
            } else {
                showDropdown(in: window)
            }
        }
    }
    
    private func showDropdown(in window: UIWindow) {
        dropdownTableView.removeFromSuperview()
        
        window.addSubview(dropdownTableView)
        
        let rect = convert(containerView.frame, to: window)
        let maxHeight = min(CGFloat(options.count) * 50, 200)
        
        dropdownTableView.frame = CGRect(
            x: rect.minX,
            y: rect.maxY + 5,
            width: rect.width,
            height: 0
        )
        
        dropdownTableView.isHidden = false
        isDropdownVisible = true
        
        UIView.animate(withDuration: 0.3) {
            self.arrowImageView.transform = CGAffineTransform(rotationAngle: .pi)
            self.dropdownTableView.frame.size.height = maxHeight
        }
    }
    
    private func hideDropdown() {
        isDropdownVisible = false
        
        UIView.animate(withDuration: 0.3, animations: {
            self.arrowImageView.transform = .identity
            self.dropdownTableView.frame.size.height = 0
        }) { _ in
            self.dropdownTableView.isHidden = true
            self.dropdownTableView.removeFromSuperview()
        }
    }
    
    func configure(placeholder: String, options: [String], initialSelection: String? = nil) {
        textField.placeholder = placeholder
        self.options = options
        
        if let initialSelection = initialSelection, options.contains(initialSelection) {
            selectedOption = initialSelection
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DropdownButtonView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropdownCell", for: indexPath) as! DropdownCell
        cell.configure(with: options[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = options[indexPath.row]
        self.selectedOption = selectedOption
        onOptionSelected?(selectedOption)
        hideDropdown()
    }
}

// MARK: - 커스텀 셀

