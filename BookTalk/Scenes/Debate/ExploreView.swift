//
//  ExploreView.swift
//  BookTalk
//
//  Created by 이민아 on 2023/06/04.
//

import UIKit

class ExploreView: UIView {
    let bookTitles = ["데미안", "채식주의자", "코스모스", "양파의 왕따일기", "어린왕자", "1984", "1984"]
    let titles = ["데미안의 행동에 대해서...", "채식주의자에 대해 이야기해봐요", "코스모스를 읽고...", "양파의 행동은 맞았을까요?", "어린왕자의 시각으로", "빅 브라더와 현대사회", "개인의 자유 vs 사회 전체의 이익"]

    
    private lazy var tableView: UITableView = {
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



extension ExploreView: UITableViewDelegate {
    
}

extension ExploreView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DebateListCell", for: indexPath) as! MyDebateTableViewCell
        cell.backgroundColor = UIColor(named: "bt-bgcolor")
        cell.bookTitleLabel.text = bookTitles[indexPath.row]
        cell.titleLabel.text = titles[indexPath.row]
        cell.newLabel.isHidden = true
        return cell
    }
    
    
}

