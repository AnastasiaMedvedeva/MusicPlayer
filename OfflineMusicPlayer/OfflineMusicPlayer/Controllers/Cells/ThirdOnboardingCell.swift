//
//  ThirdCollectionViewCell.swift
//  OfflineMusicPlayer
//
//  Created by Анастасия on 16.04.2024.
//

import UIKit
import SnapKit

final class ThirdOnboardingCell: UICollectionViewCell {
    // MARK: - GUI Variables
        private lazy var containerView: UIImageView = {
            let view = UIImageView()
            view.backgroundColor = .blue
            return view
        }()
    
    private lazy var feedbackTextImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "textImage3")
        return image
    }()
    
    private lazy var feedbackImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "evaluationImage3")
        image.contentMode = .scaleAspectFill
        return image
    }()
    private lazy var photoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photoClark")
        return image
    }()
    private lazy var feedbackLabel: UILabel = {
        let label = UILabel()
        label.text = "Ethan Clark"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var leftLikeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "leftLikeImage3")
        return image
    }()
    private lazy var rightLikeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rightLikeImage3")
        return image
    }()
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.font = .boldSystemFont(ofSize: 30)
    //        label.font = UIFont(name: "Manrope-Bold", size: 28)
            label.numberOfLines = 0
            label.textAlignment = .center
            return label
        }()
        private lazy var descriptionLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textColor = UIColor(named: "gray")
    //        label.font = .boldSystemFont(ofSize: 16)
            label.font = UIFont(name: "Manrope-Regular", size: 16)
            return label
        }()
        
        //MARK: - Initializations
        override init(frame: CGRect) {
            super.init(frame: frame)
//            addSubview(containerView)
//            containerView.
            addSubview(feedbackTextImage)
            addSubview(feedbackImage)
            addSubview(leftLikeImage)
            addSubview(rightLikeImage)
            addSubview(feedbackLabel)
            addSubview(photoImage)
            addSubview(titleLabel)
            addSubview(descriptionLabel)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        // MARK: - Methods
    func setup(_ slide: OnboardingSlide) {
        containerView.image = slide.image
            titleLabel.text = slide.title
            descriptionLabel.text = slide.description
        }
        //MARK: - Private methods
        private func setupUI() {
            backgroundColor = .black
            setupConstraints()
        }
        
        private func setupConstraints() {
            feedbackTextImage.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(-60)
                make.leading.equalToSuperview().inset(0)
                make.trailing.equalToSuperview().inset(15)
            }
            feedbackImage.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(feedbackTextImage.snp.bottom).offset(10)
            }
            
            feedbackLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(150)
                make.leading.equalToSuperview().inset(175)
            }
            photoImage.snp.makeConstraints { make in
                make.width.height.equalTo(75)
                make.top.equalToSuperview().inset(116)
                make.leading.equalToSuperview().inset(75)
            }
            leftLikeImage.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(5)
                make.top.equalToSuperview().inset(80)
            }
         
            rightLikeImage.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(5)
                make.top.equalToSuperview().inset(160)
            }
     
            titleLabel.snp.makeConstraints { make in
                make.bottom.equalToSuperview().inset(10)
                make.leading.trailing.equalToSuperview().inset(60)
            }
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.trailing.leading.equalToSuperview().inset(30)
            }
            }
    }
