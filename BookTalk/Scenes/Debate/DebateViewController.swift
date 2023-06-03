//
//  DebateViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/22.
//

import UIKit
import SnapKit

final class DebateViewController: UIViewController {
    
    private let segmentedControl : UnderlineSegmentedControl = {
        let control = UnderlineSegmentedControl(items: ["탐색", "내 토론"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let firstView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }() //mydebateview
    
    private let secondView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .yellow
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

}

private extension DebateViewController {
    func setupNavigationBar(){
        let title = UILabel()
        title.text = "토론"
        title.textColor = .black
        title.font = UIFont(name: "Pretendard-ExtraBold", size: 30)
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
        [segmentedControl,firstView,secondView].forEach{view.addSubview($0)}
        
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
    }
}
