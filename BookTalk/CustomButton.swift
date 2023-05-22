//
//  CustomButton.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/21.
//

import Foundation
import UIKit


class CustomButton: UIButton {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var config = UIButton.Configuration.filled()
    
    convenience init(text: String, bgColor: UIColor, titleColor: UIColor, imageName: String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 54).isActive = true
        //self.widthAnchor.constraint(equalToConstant: 285).isActive = true
        
        self.configuration = config
        self.configuration?.background.backgroundColor = bgColor
        self.configuration?.background.cornerRadius = 22.0
  
        self.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 19.0)
        self.setTitle(text, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = bgColor
        
        self.configuration?.image = UIImage(systemName: imageName)
        self.configuration?.baseForegroundColor = titleColor //아오ㅡㅡ
        self.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20)
        self.configuration?.imagePlacement = .leading
        self.configuration?.imagePadding = 57
        self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 17, leading: 30, bottom: 18, trailing: 105)
        self.configuration?.image?.withTintColor(titleColor)
        
        
        self.layer.cornerRadius = 22.0
        self.layer.masksToBounds = true
        self.isUserInteractionEnabled = true

    }
  
}

