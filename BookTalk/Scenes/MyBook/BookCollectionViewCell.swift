//
//  BookCollectionViewCell.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/23.
//

import UIKit
import SnapKit

class BookCollectionViewCell: UICollectionViewCell {
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .darkGray
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Light", size: 20.0)
        return label
    }()
    
    func setup() {
        setupLayout()
        //nameLabel.text = "데미안"
        //imageView.image = UIImage(named: "데미안")
    }
}

private extension BookCollectionViewCell {
    func setupLayout() {
        [imageView, nameLabel].forEach{addSubview($0)}
        
        imageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview()
        }
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalTo(imageView)
            $0.trailing.equalTo(imageView)
            $0.bottom.equalToSuperview()
        }
    }
}
