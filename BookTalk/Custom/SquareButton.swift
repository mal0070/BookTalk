//
//  SquareButton.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/24.
//

import Foundation
import UIKit

class SquareButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var config = UIButton.Configuration.filled()
    
    convenience init(title: String){
        //보조 이니셜라이저 - 미리 값을 지정
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 350).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 18.0)
        self.layer.cornerRadius = 3.0
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor(named: "bt-black")
        self.setTitleColor(.white, for: .normal)
    }
}
