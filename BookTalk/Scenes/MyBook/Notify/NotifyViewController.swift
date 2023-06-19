//
//  NotifyViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/06/19.
//

import UIKit
import SnapKit

class NotifyViewController: UIViewController {
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 16).isActive = true
        button.widthAnchor.constraint(equalToConstant: 16).isActive = true
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
    
    @objc func goBack(){
        dismiss(animated: true)
    
    }
    private lazy var label : UILabel = {
        let label = UILabel()
        label.text = "알림"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 33)
        return label
    }()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "bt-bgcolor")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(NotifyTableViewCell.self, forCellReuseIdentifier: "NotifyCell")
        return tableView
    }()
    
    private func registerXib() {
        let nibName = UINib(nibName: "NotifyTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "NotifyCell")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        [backButton,label, tableView].forEach{view.addSubview($0)}
        backButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(20)
        }
        label.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        view.backgroundColor = UIColor(named: "bt-bgcolor")
        
        registerXib()
    }
    

}

extension NotifyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifyCell", for: indexPath)
        cell.backgroundColor = UIColor(named: "bt-bgcolor")
        return cell
    }
    
    
}
