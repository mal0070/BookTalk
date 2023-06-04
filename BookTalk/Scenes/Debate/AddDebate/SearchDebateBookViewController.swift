//
//  SearchDebateBookViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/06/04.
//

import UIKit
import SnapKit

final class SearchDebateBookViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "책 제목을 \n입력해주세요"
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Medium", size: 30)
        label.textColor = UIColor(named: "bt-black")
        return label
    }()
    
    //inputAccessoryView에 대입할 View 정의
    private lazy var accessoryView: UIView = {
        return UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 72.0))
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "책 제목", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textField.font = UIFont(name: "Pretendard-Medium", size: 20)
        textField.textColor = .black
        textField.delegate = self
        
        textField.inputAccessoryView = accessoryView
        textField.translatesAutoresizingMaskIntoConstraints = false
        
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
        button.addTarget(self, action: #selector(goToChooseBook), for: .touchUpInside)
        return button
    }()
    
    @objc func goToChooseBook() {
        let vc = ChooseDebateBookViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //빈 화면 터치 시 키보드 내리기
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavigationBar()
        view.backgroundColor = UIColor(named: "bt-bgcolor")
        
        addTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) { //화면이 전환되자마자
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true //탭바 숨기기
        
        self.titleTextField.becomeFirstResponder()
    }

}

extension SearchDebateBookViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
        let backButton = navigationController?.navigationBar.topItem?.backBarButtonItem
        backButton?.tintColor = UIColor(named: "bt-black")
    }
}

extension SearchDebateBookViewController {
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
        
        accessoryView.addSubview(searchButton)
        guard let searchButtonSuperview = searchButton.superview else {return}
        searchButton.leadingAnchor.constraint(equalTo: searchButtonSuperview.leadingAnchor, constant: 16).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: searchButtonSuperview.trailingAnchor, constant: -16).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
}


extension SearchDebateBookViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //return 키 눌렀을 때 키보드 내리기
        self.titleTextField.resignFirstResponder()
        
        //검색 -> 화면전환
        let vc = ChooseDebateBookViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        return true
    }

}


