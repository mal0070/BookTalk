//
//  MyDebateView.swift
//  BookTalk
//
//  Created by 이민아 on 2023/06/03.
//

import UIKit

class MyDebateView: UIView {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
       // tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "bt-bgcolor")
        
        tableView.register(ChooseBookTableViewCell.self, forCellReuseIdentifier: "ChooseBookTableViewCell")
        
        return tableView
    }()
    
    private func registerXib() {
        let nibName = UINib(nibName: "ChooseBookTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ChooseBookTableViewCell")
    }

}

extension MyDebateView: UITableViewDelegate {
    
}
/*
extension MyDebateView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}*/
