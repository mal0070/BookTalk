//
//  ViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/21.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "BookTalk"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Bold", size: 39.0)
        return label
    }()
    
    var config = UIButton.Configuration.filled()

    private lazy var signUpButton : UIButton = {
        let button = UIButton(configuration: config)
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 19.0)
        button.titleLabel?.textColor = .black
        button.configuration?.background.backgroundColor = .lightGray
        button.configuration?.background.cornerRadius = 22.0
        button.heightAnchor.constraint(equalToConstant: 54.0).isActive = true
        //button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var kakakoLoginButton: RoundButton = {
        let button = RoundButton(text: "카카오로 계속하기", bgColor: .systemYellow, titleColor: .black, imageName: "message.fill")
        return button
    }()
    
    private lazy var appleLoginButton: RoundButton = {
        let button = RoundButton(text: "Apple로 계속하기", bgColor: .black, titleColor: .white, imageName: "apple.logo")
        return button
    }()
    
    
    private lazy var loginLabel : UILabel = {
        let clickLabel = UITapGestureRecognizer(target: self, action: #selector(goToTab))
        let label = UILabel()
        label.text = "로그인"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Light", size: 19.0)
        label.addGestureRecognizer(clickLabel)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    @objc func goToTab(sender: UITapGestureRecognizer){
        let tab = TabBarController()
        tab.modalPresentationStyle = .fullScreen
        tab.modalTransitionStyle = .coverVertical
        
        present(tab, animated: true)
        if presentedViewController == tab {
            presentingViewController?.dismiss(animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

}

extension LoginViewController {
    private func setupLayout() {
        let buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.spacing = 20.0
        [signUpButton,kakakoLoginButton,appleLoginButton].forEach{buttonStack.addArrangedSubview($0)}
        
        [titleLabel,buttonStack,loginLabel].forEach{view.addSubview($0)}
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(200.0)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        buttonStack.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(110.0)
        }
        loginLabel.snp.makeConstraints{
            $0.top.equalTo(buttonStack.snp.bottom).offset(20.0)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
    }
    
}


