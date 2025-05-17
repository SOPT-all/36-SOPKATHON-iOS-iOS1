import UIKit
import SnapKit
import Then

class MatchSuccessViewController: BaseViewController {
    
    private let backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "bgSuccess")
        $0.contentMode = .scaleAspectFill
    }
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "Clear"), for: .normal)
        $0.contentMode = .scaleAspectFit
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
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func configure() {
        super.configure()
        
        view.addSubview(backgroundImageView)
        
        addSubviews(
            backButton,
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
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
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
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        copyPhoneButton.addTarget(self, action: #selector(copyPhoneButtonTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(laterLabelTapped))
        laterLabel.isUserInteractionEnabled = true
        laterLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func laterLabelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func copyPhoneButtonTapped() {
        UIPasteboard.general.string = "010-XXXX-XXXX"
        
        showAlert(title: "복사 완료", message: "안심번호가 클립보드에 복사되었습니다.")
    }
}

#Preview {
    MatchSuccessViewController()
}
