//
//  BookWriteViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/24.
//

import UIKit
import SnapKit

class BookWriteViewController: UIViewController {
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "문구 입력 ..." //이 문구가 입력을 시작하면 자동으로 사라지도록 -> textViewDelegate
        textView.textColor = .secondaryLabel
        textView.delegate = self
        
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bt-bgcolor")
        
        view.addSubview(textView)
        textView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }

        setupNavigationBar()
        
    }
    
    //textView에 기록하면 기록한 내용 BookDetailView에 돌려주면서 -> 화면변경: 기록추가, 버튼(기록하기->기록수정)
    //outStargram 참고

}

private extension BookWriteViewController {
    func setupNavigationBar(){
        navigationItem.title = "기록하기"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(upload))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
    }
    
    @objc func cancel(){
        let vc = BookDetailViewController()
        vc.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func upload() {
        let vc = BookDetailViewController()
       
        vc.recordTextView.text = textView.text
        vc.recordTextView.textColor = .black
        vc.writeButton.setTitle("기록 수정", for: .normal)
        vc.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension BookWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else {return}
        textView.text = nil
        textView.textColor = .label
    }
}
