//
//  DebateDetailViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/06/02.
//

import UIKit

class DebateDetailViewController: UIViewController {
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
