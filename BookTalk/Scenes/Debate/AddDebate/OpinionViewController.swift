//
//  OpinionViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/06/04.
//


import UIKit
import SnapKit

final class OpinionViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "주제에 대한 의견을 \n입력해주세요"
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Medium", size: 30)
        label.textColor = UIColor(named: "bt-black")
        return label
    }()
    
    //inputAccessoryView에 대입할 View 정의
    private lazy var accessoryView: UIView = {
        return UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 72.0))
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "자유롭게 의견을 적어주세요" //이 문구가 입력을 시작하면 자동으로 사라지도록 -> textViewDelegate
        textView.textColor = .secondaryLabel
        textView.delegate = self
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        
        textView.inputAccessoryView = accessoryView
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    private lazy var searchButton: SquareButton = {
        let button = SquareButton(title: "완료")
        button.addTarget(self, action: #selector(goToMyDebate), for: .touchUpInside)
        return button
    }()
    
    @objc func goToMyDebate() {
        let vc = DebateViewController()
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
        self.textView.becomeFirstResponder()
        
    }

}

extension OpinionViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
        let backButton = navigationController?.navigationBar.topItem?.backBarButtonItem
        backButton?.tintColor = UIColor(named: "bt-black")
    }
}

extension OpinionViewController {
    func setupLayout(){
        [label,textView,searchButton].forEach{view.addSubview($0)}
        label.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.equalToSuperview().inset(20)
        }
        
        textView.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(221)
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

extension OpinionViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else {return}
        textView.text = nil
        textView.textColor = .label
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        self.textView.resignFirstResponder()
    }
    
}



