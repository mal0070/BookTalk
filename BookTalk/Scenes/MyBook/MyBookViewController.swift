//
//  MyBookViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/22.
//

import UIKit

final class MyBookViewController: UIViewController {
    
    let images = ["데미안", "어린왕자", "1984", "작별인사", "상실의 시대"]
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "BookCollectionViewCell")
        collectionView.backgroundColor = UIColor(named: "bt-bgcolor")
        return collectionView
    }()
    
    private var config = UIButton.Configuration.filled()
    
    private lazy var addBookButton: UIButton = {
        let button = UIButton(type: .custom, primaryAction: UIAction(handler: { _ in
            let vc = SearchBookViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        button.configuration = config
        button.configuration?.image = UIImage(systemName: "plus")
        button.configuration?.baseForegroundColor = .black
        button.configuration?.imagePlacement = .leading
        button.configuration?.imagePadding = 12
        button.configuration?.background.cornerRadius = 35
        button.configuration?.baseBackgroundColor = UIColor(named: "bt-button")
        
        button.setTitle("도서추가", for: .normal)

        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
       
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        //fetchData()
        
        view.addSubview(addBookButton)
        addBookButton.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        view.backgroundColor = UIColor(named: "bt-bgcolor")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
    }

}

private extension MyBookViewController {
    func setupNavigationBar(){
        let title = UILabel()
        title.text = "내 도서"
        title.textColor = .black
        title.font = UIFont(name: "Pretendard-ExtraBold", size: 33)
        title.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: title)
        
        let profileButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "person"), target: self, action: nil)
        profileButton.tintColor = .black
        let notifyButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "bell.badge"), target: self, action: #selector(notify))
        notifyButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [profileButton, notifyButton]
        
    }
    
    @objc func notify(sender: UITapGestureRecognizer){
        let vc = NotifyViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        
        present(vc, animated: true)
    }
    
}

extension MyBookViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20.0) / 3 - 10.0
        return CGSize(width: width, height: width*2)
    }
    
    //cell 선택했을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let bookDetail = postList[indexPath.item]
        let vc = BookDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyBookViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell
        cell?.setup()
        cell?.imageView.image = UIImage(named: images[indexPath.row])
        cell?.nameLabel.text = images[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    
}




