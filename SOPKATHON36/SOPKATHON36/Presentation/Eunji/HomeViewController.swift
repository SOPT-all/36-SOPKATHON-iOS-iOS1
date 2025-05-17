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

        [].forEach {
            view.addSubview($0)
        }

    }

    private func setUpConstraints() {

    }
}
