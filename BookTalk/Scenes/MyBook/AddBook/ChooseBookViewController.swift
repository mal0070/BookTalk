//
//  ChooseBookViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/30.
//

import UIKit
import SnapKit

class ChooseBookViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "읽은 책을 \n선택해주세요"
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Medium", size: 30)
        label.textColor = UIColor(named: "bt-black")
        return label
    }()
    
    private lazy var searchIconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        
        return imageView
    }()
    
    private lazy var bookLabel: UILabel = {
        let label = UILabel()
        label.text = "데미안"
        label.font = UIFont(name: "Pretendard-Medium", size: 24)
        
        return label
    }()
    
    private lazy var underLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(named: "bt-black")
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "bt-bgcolor")
        
        tableView.register(ChooseBookTableViewCell.self, forCellReuseIdentifier: "ChooseBookTableViewCell")
        
        return tableView
    }()
    
    private func registerXib() {
        let nibName = UINib(nibName: "ChooseBookTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ChooseBookTableViewCell")
    }
    
    private lazy var nextButton: SquareButton = {
        let button = SquareButton(title: "다음")
        button.addTarget(self, action: #selector(goToBookDetail), for: .touchUpInside)
        return button
    }()
    
    @objc func goToBookDetail() {
        let vc = BookDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bt-bgcolor")
        
        setupNavigationBar()
        setupLayout()
        registerXib()
    }
    
    override func viewWillAppear(_ animated: Bool) { //화면이 전환되자마자
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true //탭바 숨기기
    }

}

extension ChooseBookViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = ""
        let backButton = navigationController?.navigationBar.topItem?.backBarButtonItem
        backButton?.tintColor = UIColor(named: "bt-black")
    }
    func setupLayout(){
        [label,searchIconImageView, bookLabel, underLineView,tableView,nextButton].forEach{view.addSubview($0)}
        
        label.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.leading.equalToSuperview().inset(20)
        }
        
        searchIconImageView.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }
        
        bookLabel.snp.makeConstraints{
            $0.top.equalTo(searchIconImageView)
            $0.leading.equalTo(searchIconImageView.snp.trailing).offset(10)
        }
        
        underLineView.snp.makeConstraints{
            $0.top.equalTo(bookLabel.snp.bottom).offset(5)
            $0.leading.equalTo(searchIconImageView)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(underLineView.snp.bottom).offset(1)
            $0.leading.equalTo(searchIconImageView)
            $0.trailing.equalTo(underLineView)
            $0.bottom.equalTo(nextButton.snp.top).inset(10)
        }
        
        nextButton.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
    }
}

extension ChooseBookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //셀에 체크 표시 나타남
    }

}

extension ChooseBookViewController: UITableViewDataSource {
    //section 당 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseBookTableViewCell", for: indexPath) as! ChooseBookTableViewCell
        cell.backgroundColor = UIColor(named: "bt-bgcolor")
        return cell
    }

}
//tableView가 안뜸..왜죠
