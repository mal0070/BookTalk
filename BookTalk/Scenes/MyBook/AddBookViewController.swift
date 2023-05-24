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
        label.text = "책 제목을 \n입력해주세요"
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Medium", size: 30)
        label.textColor = UIColor(named: "bt-black")
        return label
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "책 제목", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.font = UIFont(name: "Pretendard-Medium", size: 20)
        textField.textColor = .black
        textField.delegate = self
        return textField
    }()
    
    private lazy var underLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(named: "bt-black")
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    private lazy var searchButton: SquareButton = {
        let button = SquareButton(title: "검색")
        //button.isUserInteractionEnabled = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = UIColor(named: "bt-bgcolor")
    }

}

extension AddBookViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
        let backButton = navigationController?.navigationBar.topItem?.backBarButtonItem
        backButton?.tintColor = UIColor(named: "bt-black")
        
        //backbutton 누르면 탭 바 다시 생김
    }
}

extension AddBookViewController {
    func setupLayout(){
        [label,titleTextField,underLineView,searchButton].forEach{view.addSubview($0)}
        label.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.equalToSuperview().inset(20)
        }
        
        titleTextField.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        underLineView.snp.makeConstraints{
            $0.top.equalTo(titleTextField.snp.bottom).offset(5)
            $0.leading.equalTo(titleTextField)
            $0.trailing.equalTo(titleTextField)
        }
        searchButton.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
    }
}

extension AddBookViewController: UITextFieldDelegate {
    /*func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //자동완성
        
    }*/
    

}

