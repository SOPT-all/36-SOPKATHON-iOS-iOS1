//
//  MatchingViewController.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/17/25.
//

import UIKit

final class MatchingViewController: BaseViewController {

    private let rootView = MatchingView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
    }
    
    private func setAddTarget() {
        rootView.retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        rootView.matchingButton.addTarget(self, action: #selector(matchingButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func retryButtonTapped() {
        if rootView.count < 5 {
            rootView.count += 1
            rootView.changeCount()
        }
    }
    
    @objc
    private func matchingButtonTapped() {
        
    }

}
