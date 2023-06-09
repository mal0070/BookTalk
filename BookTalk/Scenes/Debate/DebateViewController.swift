//
//  DebateViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/22.
//

import UIKit
import SnapKit

final class DebateViewController: UIViewController {
    
    private var config = UIButton.Configuration.filled()
    
    private lazy var addDebateButton: UIButton = {
        let button = UIButton(type: .custom, primaryAction: UIAction(handler: { _ in
            let vc = SearchDebateBookViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        button.configuration = config
        button.configuration?.image = UIImage(systemName: "plus")
        button.configuration?.baseForegroundColor = .black
        button.configuration?.imagePlacement = .leading
        button.configuration?.imagePadding = 12
        button.configuration?.background.cornerRadius = 35
        button.configuration?.baseBackgroundColor = UIColor(named: "bt-button")
        
        button.setTitle("토론방 추가", for: .normal)

        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.widthAnchor.constraint(equalToConstant: 158).isActive = true
       
        return button
    }()
    
    
    private let segmentedControl : UnderlineSegmentedControl = {
        let control = UnderlineSegmentedControl(items: ["내 토론", "탐색"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let firstView: MyDebateView = {
        let view = MyDebateView()
        view.backgroundColor = UIColor(named: "bt-bgcolor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }() //mydebateview
    
    private let secondView: ExploreView = {
        let view = ExploreView()
        view.backgroundColor = UIColor(named: "bt-bgcolor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
    
    var shouldHideFirstView: Bool? {
       didSet {
         guard let shouldHideFirstView = self.shouldHideFirstView else { return }
         self.firstView.isHidden = shouldHideFirstView
         self.secondView.isHidden = !self.firstView.isHidden
       }
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bt-bgcolor")
        setupNavigationBar()
        setupLayout()
        
        self.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.didChangeValue(segment: self.segmentedControl)
    }
    
     
     @objc private func didChangeValue(segment: UnderlineSegmentedControl) {
       self.shouldHideFirstView = segment.selectedSegmentIndex != 0
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }

}

private extension DebateViewController {
    func setupNavigationBar(){
        let title = UILabel()
        title.text = "토론"
        title.textColor = .black
        title.font = UIFont(name: "Pretendard-ExtraBold", size: 33)
        title.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: title)
        
        let profileButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "person"), target: self, action: nil)
        profileButton.tintColor = .black
        let searchButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "magnifyingglass"), target: self, action: #selector(search))
        searchButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [profileButton, searchButton]
        
    }
    
    @objc func search(){
        //토론 검색
    }
}

private extension DebateViewController {
    func setupLayout() {
        [segmentedControl,firstView,secondView, addDebateButton].forEach{view.addSubview($0)}
        
        segmentedControl.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        firstView.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom).offset(10)
            $0.leading.equalTo(segmentedControl)
            $0.trailing.equalTo(segmentedControl)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        secondView.snp.makeConstraints{
            $0.top.equalTo(firstView)
            $0.leading.equalTo(firstView)
            $0.trailing.equalTo(firstView)
            $0.bottom.equalTo(firstView)
        }
        addDebateButton.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.bottom.equalTo(firstView).inset(20)
        }
    }
}
