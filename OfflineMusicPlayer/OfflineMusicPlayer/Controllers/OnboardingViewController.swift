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
//    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = (view.frame.width - 40) / 1
        layout.itemSize = CGSize(width: width, height: width + 40)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: width, height: width), collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()
    private lazy var pageControl: UIPageControl = {
            let pageControl = UIPageControl()
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            pageControl.pageIndicatorTintColor = UIColor(named: "gray")
            pageControl.currentPageIndicatorTintColor = UIColor(named: "purple")
            //pageControl.//change width indicator current page
            //pageControl.hidesForSinglePage = true
            pageControl.backgroundStyle = .automatic
            pageControl.numberOfPages = 4
            return pageControl
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

    // MARK: - Properties
    var slides: [OnboardingSlide] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        setupUI()
        collectionView.register(FirstOnboardingCell.self, forCellWithReuseIdentifier: "FirstOnboardingCell")
        slides = [
            OnboardingSlide(image: UIImage(named: "image1") ?? UIImage.add, title: "Your music library is always with you", description: "Search for any song and listen any time"),
            OnboardingSlide(image: UIImage(named: "image2") ?? UIImage.add, title: "Import from any source and offline", description: "Listen to music "),
            OnboardingSlide(image: UIImage(named: "image3") ?? UIImage.add , title: "We value your opinion", description: "Your feedback is important to us and will help us make our app even better for you"),
            OnboardingSlide(image: "image4") ?? UIImage.add, title: "Get all the features with no limits", description: //add 2 labels)            ]
    }
// MARK: - Private methods
    private func setupUI() {
        collectionView.backgroundColor = .black
        self.view.addSubview(collectionView)
        self.view.addSubview(pageControl)
        self.view.addSubview(continueButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            make.bottom.equalTo(continueButton.snp.top)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY).offset(50)
        }
        continueButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstOnboardingCell", for: indexPath) as? FirstOnboardingCell else { return UICollectionViewCell()}
        cell.setup(slides[indexPath.row])
        return cell
    }

}
//MARK: - UICollectionViewDelegate
extension OnboardingViewController: UICollectionViewDelegate {

}

