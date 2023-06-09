//
//  MyDebateView.swift
//  BookTalk
//
//  Created by 이민아 on 2023/06/03.
//

import UIKit

class MyDebateView: UIView {
    let bookTitles = ["데미안", "채식주의자", "코스모스"]
    let titles = ["데미안의 행동에 대해서...", "채식주의자에 대해 이야기해봐요", "코스모스를 읽고..."]

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "bt-bgcolor")
        
        tableView.register(MyDebateTableViewCell.self, forCellReuseIdentifier: "DebateListCell")
        
        return tableView
    }()
    
    private func registerXib() {
        let nibName = UINib(nibName: "MyDebateTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "DebateListCell")
    }
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        registerXib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MyDebateView: UITableViewDelegate {
    
}

extension MyDebateView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DebateListCell", for: indexPath) as! MyDebateTableViewCell
        cell.backgroundColor = UIColor(named: "bt-bgcolor")
        cell.bookTitleLabel.text = bookTitles[indexPath.row]
        cell.titleLabel.text = titles[indexPath.row]
        if indexPath.row == 0 {
            cell.newLabel.isHidden = false
        } else {
            cell.newLabel.isHidden = true
        }
        return cell
    }
    
    
}
