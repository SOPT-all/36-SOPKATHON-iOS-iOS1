//
//  BaseViewController.swift
//  SOPKATHON36
//
//  Created by 선영주 on 5/17/25.
//
import UIKit

class BaseViewController: UIViewController {

    private var activityIndicator: UIActivityIndicatorView?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
        hideKeyboardWhenTapped()
    }

    // MARK: - Configure UI

    func configure() {
        view.backgroundColor = .bgWhite
    }

    // MARK: - Layout

    func setConstraints() {}

    func addSubviews(_ views: UIView...) {
        views.forEach { view.addSubview($0) }
    }

    // MARK: - Keyboard Handling

    func hideKeyboardWhenTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: - Loading Indicator

    func showLoading() {
        if activityIndicator == nil {
            activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator?.center = view.center
            activityIndicator?.hidesWhenStopped = true
            view.addSubview(activityIndicator!)
        }
        activityIndicator?.startAnimating()
    }

    func hideLoading() {
        activityIndicator?.stopAnimating()
    }

    // MARK: - Alert

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
