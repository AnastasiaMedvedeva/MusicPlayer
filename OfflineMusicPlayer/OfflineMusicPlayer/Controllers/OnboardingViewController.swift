//
//  OnboardingViewController.swift
//  OfflineMusicPlayer
//
//  Created by Анастасия on 16.04.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
// MARK: - GUI Variables
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
//        let layout = UICollectionViewFlowLayout()
//        let width = (view.frame.width - 15) / 2
//        layout.itemSize = CGSize(width: width, height: width)
//        layout.minimumLineSpacing = 5
//        layout.minimumInteritemSpacing = 5
//        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - searchBar.frame.height), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        //button. //font
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "purple")
        return button
    }()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
// MARK: - Private methods
    private func setupUI() {
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
            make.bottom.equalTo(continueButton.snp.top).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(centerY)
            make.leading.equalToSuperview().inset(10)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return
    }
    
}
//MARK: - UICollectionViewDelegate
extension OnboardingViewController: UICollectionViewDelegate {
    
}
