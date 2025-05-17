//
//  MatchingViewController.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/17/25.
//

import UIKit

final class MatchingViewController: BaseViewController {

    private let recommendService: RecommendServiceProtocol = MockRecommendService()
    private var recommendUser: RecommendUserEntity?
    
    private let rootView = MatchingView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRecommend()
        setAddTarget()
    }
    
    private func setAddTarget() {
        rootView.retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        rootView.matchingButton.addTarget(self, action: #selector(matchingButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func retryButtonTapped() {
        if rootView.count < 5 {
            fetchRecommend()
            rootView.count += 1
            rootView.changeCount()
        }
    }
    
    @objc
    private func matchingButtonTapped() {
        
    }
    
    private func fetchRecommend() {
        Task {
            do {
                recommendUser = try await recommendService.fetchRecommendUser()
                guard let recommendUser else { return }
                
                rootView.cardView.dataBind(recommendUser)
            } catch {
                print("error!")
            }
        }
    }

}
