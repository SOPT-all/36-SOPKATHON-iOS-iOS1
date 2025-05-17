//
//  MatchSuccessViewController.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/16/25.
//

import UIKit
import SnapKit
import Then

class MatchSuccessViewController: BaseViewController {
    
    private let phoneNumber: String
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "bgSuccess")
        $0.contentMode = .scaleAspectFill
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "친구 매칭에 성공했어요!"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textAlignment = .center
    }
    
    private let mainProfileImageView = UIImageView().then {
        $0.image = UIImage(named: "SuccessBigProfile")
        $0.layer.cornerRadius = 80
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let smallProfileImageView = UIImageView().then {
        $0.image = UIImage(named: "SuccessSmallProfile")
        $0.layer.cornerRadius = 51
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "친구의 안심번호를 복사하여\n전화를 걸어주세요"
        $0.font = .head1
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private let laterLabel = UILabel().then {
        $0.text = "나중에 할래요"
        $0.font = .body2
        $0.textColor = .gray600
        $0.textAlignment = .center
    }
    
    private let underlineView = UIView().then {
        $0.backgroundColor = .gray600
    }
    
    private let copyPhoneButton = UIButton().then {
        $0.setTitle("안심번호 복사하기", for: .normal)
        $0.backgroundColor = .primaryLight
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = .body3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupNavigationBar() {
        // 네비게이션 바 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        // 기본 back 버튼 숨기기
        navigationItem.hidesBackButton = true
        
        // 좌측에 닫기 버튼 추가
        let closeButton = UIBarButtonItem(
            image: UIImage(named: "Clear"),
            style: .plain,
            target: self,
            action: #selector(closeButtonTapped)
        )
        closeButton.tintColor = .black
        navigationItem.leftBarButtonItem = closeButton
    }
    
    override func configure() {
        super.configure()
        
        view.addSubview(backgroundImageView)
        
        addSubviews(
            titleLabel,
            mainProfileImageView,
            smallProfileImageView,
            descriptionLabel,
            laterLabel,
            underlineView,
            copyPhoneButton
        )
    }
    
    override func setConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        mainProfileImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview().offset(-50)
            $0.width.height.equalTo(160)
        }
        
        smallProfileImageView.snp.makeConstraints {
            $0.top.equalTo(mainProfileImageView.snp.top).offset(80)
            $0.centerX.equalToSuperview().offset(70)
            $0.width.height.equalTo(102)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(smallProfileImageView.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        laterLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.top.equalTo(laterLabel.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(laterLabel.snp.width)
            $0.height.equalTo(1)
        }
        
        copyPhoneButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(47)
        }
    }
    
    private func setupActions() {
        copyPhoneButton.addTarget(self, action: #selector(copyPhoneButtonTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(laterLabelTapped))
        laterLabel.isUserInteractionEnabled = true
        laterLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc private func closeButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func laterLabelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func copyPhoneButtonTapped() {
        UIPasteboard.general.string = self.phoneNumber
        
        let alertController = UIAlertController(
            title: "안심번호",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        let phoneNumberAction = UIAlertAction(title: phoneNumber, style: .default) { _ in
            self.makePhoneCall(phoneNumber: self.phoneNumber)
        }
        alertController.addAction(phoneNumberAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = copyPhoneButton
            popoverController.sourceRect = copyPhoneButton.bounds
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func makePhoneCall(phoneNumber: String) {
        if let phoneURL = URL(string: "tel://\(phoneNumber.replacingOccurrences(of: "-", with: ""))") {
            if UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
            }
        }
    }
}

#Preview {
    MatchSuccessViewController(phoneNumber: "010-XXXX-XXXX")
}
