//
//  BookDetailViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/23.
//

import UIKit
import SnapKit

final class BookDetailViewController: UIViewController {
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .darkGray
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "데미안"
        label.font = UIFont(name: "Pretendard-Bold", size: 25)
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "헤르만 헤세 저"
        label.font = UIFont(name: "Pretendard-Medium", size: 20)
        label.textColor = .secondaryLabel
        return label
    }()
    
    
    lazy var recordTextView: UITextView = {
        let textView = UITextView()
        textView.text = "기록을 남겨보세요."
        textView.font = UIFont(name: "Pretendard-Medium", size: 20)
        textView.textColor = .secondaryLabel
        
        let padding: CGFloat = 20.0
        let insets = UIEdgeInsets(top: padding, left: padding, bottom: 0, right: 0)
        textView.contentInset = insets
        
        return textView
    }()
    
    lazy var writeButton: UIButton = {
        let button = UIButton(type: .custom, primaryAction: UIAction(handler: { _ in
            let vc = BookWriteViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        button.setTitle("기록하기", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 22
       
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        imageView.image = UIImage(named: "데미안")
        view.backgroundColor = UIColor(named: "bt-bgcolor")
    }
    
    override func viewWillAppear(_ animated: Bool) { //화면이 전환되자마자
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false //탭바 나타나기
    }


}

extension BookDetailViewController {
    func setupLayout(){
        [imageView, titleLabel, authorLabel, recordTextView, writeButton].forEach{view.addSubview($0)}
        
        imageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.width.equalTo(140)
            $0.height.equalTo(210)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.centerX.equalTo(imageView)
        }
        authorLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(imageView)
        }

        recordTextView.snp.makeConstraints{
            $0.top.equalTo(authorLabel.snp.bottom).offset(40)
            $0.centerX.equalTo(imageView)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        writeButton.snp.makeConstraints{
            $0.centerX.equalTo(imageView)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(70)
            $0.height.equalTo(40)
            $0.width.equalTo(94)
        }
    }
}

