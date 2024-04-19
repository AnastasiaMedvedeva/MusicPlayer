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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = (view.frame.width - 10)
        layout.itemSize = CGSize(width: width, height: width + 20)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: width, height: width), collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    private lazy var pageControl: UIPageControl = {
            let pageControl = UIPageControl()
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            pageControl.pageIndicatorTintColor = UIColor(named: "gray")
            pageControl.currentPageIndicatorTintColor = UIColor(named: "purple")
            pageControl.isUserInteractionEnabled = false
            pageControl.preferredCurrentPageIndicatorImage = UIImage(named: "indicator.svg")
//            pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
            pageControl.backgroundStyle = .automatic
            pageControl.numberOfPages = 4
            return pageControl
        }()
        
    private lazy var pagerStack: UIStackView = {
        let pagerStack = UIStackView()
        return pagerStack
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
//        button.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 21)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "purple")
        button.addTarget(self, action: #selector(continueButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Properties
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                continueButton.setTitle("Get Started!", for: .normal)
            }  else {
                continueButton.setTitle("Continue", for: .normal)
            }
        }
    }
    // MARK: - Private properties
    private var pagers: [UIView] = []
    private var width: NSLayoutConstraint?
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        setupUI()
        collectionView.register(FirstOnboardingCell.self, forCellWithReuseIdentifier: "FirstOnboardingCell")
        collectionView.register(ThirdOnboardingCell.self, forCellWithReuseIdentifier: "ThirdOnboardingCell")
        collectionView.register(FourthOnboardingCell.self, forCellWithReuseIdentifier: "FourthOnboardingCell")
        slides = [
        OnboardingSlide(image: UIImage(named:"image1"), title: "Your music library is always with you", description: "Search for any song and listen any time",freeLabel: nil),
        OnboardingSlide(image: UIImage(named: "image2"), title: "Import from any source and offline", description: "Listen to music from different sources even without internet access", freeLabel: nil),
        OnboardingSlide(image: UIImage(named: "image3"), title: "We value your opinion", description: "Your feedback is important to us and will help us make our app even better for you", freeLabel: nil),
                        
        OnboardingSlide(image: UIImage(named: "image4"), title: "Get all the features with no limits", description: "then 349,00 RUB/Week", freeLabel: "3-Day free trial,")
        ]
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(0)
            make.bottom.equalTo(continueButton.snp.top)
            make.leading.trailing.equalToSuperview().inset(0)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY).offset(0)
        }
        continueButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(60)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc
    private func continueButtonAction() {
        if currentPage == slides.count - 1 {
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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
        
        guard let slide = slides[indexPath.row] as? OnboardingSlide else { return UICollectionViewCell()}
        
        if let label = slide.freeLabel,
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FourthOnboardingCell", for: indexPath) as? FourthOnboardingCell {
            cell.setup(slide)
            return cell
        } else if let icon = slide.image,
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstOnboardingCell", for: indexPath) as? FirstOnboardingCell {
            cell.setup(slide)
            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdOnboardingCell", for: indexPath) as? ThirdOnboardingCell {
            cell.setup(slide)
            return cell
        }
        return UICollectionViewCell()
    }
}
    //MARK: - UICollectionViewDelegate
    extension OnboardingViewController: UICollectionViewDelegate {
        
    }
    //MARK: - UICollectionViewDelegateFlowLayout
    extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let width = scrollView.frame.width
            currentPage = Int(scrollView.contentOffset.x / width)
        }
    }

