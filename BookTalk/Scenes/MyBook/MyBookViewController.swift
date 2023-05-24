//
//  MyBookViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/22.
//

import UIKit

final class MyBookViewController: UIViewController {
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 15
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "BookCollectionViewCell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(20)
        }
        //fetchData()
    }

}

private extension MyBookViewController {
    func setupNavigationBar(){
        navigationItem.title = "내 도서"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true //large
        
        var profileButtonConfig = UIButton.Configuration.plain()
        profileButtonConfig.image = UIImage(systemName: "person.crop.circle.fill")
        profileButtonConfig.baseForegroundColor = .gray
        profileButtonConfig.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 33)
        profileButtonConfig.contentInsets = NSDirectionalEdgeInsets(top: 80, leading: 230, bottom: 0, trailing: 20)
        let profileButton = UIButton(configuration: profileButtonConfig)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)
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
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell
        cell?.setup()
        return cell ?? UICollectionViewCell()
    }
    
    
}



