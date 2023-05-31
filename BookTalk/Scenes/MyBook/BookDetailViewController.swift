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
        label.text = "헤르만 헤세"
        label.font = UIFont(name: "Pretendard-Medium", size: 20)
        return label
    }()
    
    private lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.text = "민음사"
        label.font = UIFont(name: "Pretendard-Medium", size: 20)
        return label
    }()
   
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "내가 쓴 글"
        label.font = UIFont(name: "Pretendard-Bold", size: 20)
        return label
    }()
    
    private lazy var noneLabel: UILabel = {
        let label = UILabel()
        label.text = "기록된 글이 없습니다"
        label.font = UIFont(name: "Pretendard-Medium", size: 20)
        return label
    }()
    
    private lazy var writeButton: UIButton = {
        let button = UIButton(type: .custom, primaryAction: UIAction(handler: { _ in
            let vc = BookWriteViewController()
            self.navigationController?.pushViewController(vc, animated: true) //present로 바꾸기
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
    
    override func viewWillAppear(_ animated: Bool) { //탭바 숨기기
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

}

extension BookDetailViewController {
    func setupLayout(){
        [imageView, titleLabel, authorLabel, companyLabel, topLabel, noneLabel, writeButton].forEach{view.addSubview($0)}
        
        imageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(140)
            $0.height.equalTo(210)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(imageView)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        authorLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
        }
        companyLabel.snp.makeConstraints{
            $0.top.equalTo(authorLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
        }
        topLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(30)
            $0.leading.equalTo(imageView)
        }
        noneLabel.snp.makeConstraints{
            $0.top.equalTo(topLabel.snp.bottom).offset(100)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        writeButton.snp.makeConstraints{
            $0.top.equalTo(noneLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(noneLabel)
            $0.height.equalTo(40)
            $0.width.equalTo(94)
        }
    }
}

