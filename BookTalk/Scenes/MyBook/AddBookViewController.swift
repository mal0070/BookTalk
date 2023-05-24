//
//  AddBookViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/24.
//

import UIKit

final class AddBookViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "책 제목을 입력해주세요"
        label.font = UIFont(name: "Pretendard-Bold", size: 30)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "책 제목"
        label.font = UIFont(name: "Pretendard-Light", size: 20)
        return label
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize:17.0)
        textField.textColor = .black
        textField.delegate = self
        return textField
    }()
    
    private lazy var nextButton: SquareButton = {
        let button = SquareButton(title: "다음")
        button.isUserInteractionEnabled = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

}

extension AddBookViewController {
    func setupLayout(){
        [label, titleLabel,titleTextField,nextButton].forEach{view.addSubview($0)}
        label.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }
        titleTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        nextButton.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
    }
}

extension AddBookViewController: UITextFieldDelegate {
    /*func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //자동완성
        
    }*/
}

