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
            return view
        }()
    private lazy var feedbackTextImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "textImage3")
        return image
    }()
    
    private lazy var containerFeedbackView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private lazy var feedbackImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "evaluationImage3")
        return image
    }()
    private lazy var feedbackLabel: UILabel = {
        let label = UILabel()
        label.text = "Ethan Clark"
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
            addSubview(containerView)
            containerView.addSubviews([feedbackTextImage,containerFeedbackView, leftLikeImage, rightLikeImage])
            containerFeedbackView.addSubview(feedbackImage)
            containerFeedbackView.addSubview(feedbackLabel)
            
            addSubview(titleLabel)
            addSubview(descriptionLabel)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        // MARK: - Methods
    func setup(_ slide: OnboardingSlide) {
        containerView = slide.view ?? UIImageView()
            titleLabel.text = slide.title
            descriptionLabel.text = slide.description
        }
        //MARK: - Private methods
        private func setupUI() {
            backgroundColor = .black
            setupConstraints()
        }
        
        private func setupConstraints() {
            containerView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(-75)
                make.trailing.leading.equalToSuperview().inset(30)
            }
            feedbackTextImage.snp.makeConstraints { make in
                make.top.equalTo(containerView.snp.top).offset(0)
                make.leading.equalTo(containerView.snp.leading).offset(0)
                make.trailing.equalTo(containerView.snp.trailing).offset(0)
            }
            
            feedbackLabel.snp.makeConstraints { make in
                make.centerX.equalTo(containerFeedbackView.snp.centerX)
                make.centerY.equalTo(containerFeedbackView.snp.centerY)
            }
            feedbackImage.snp.makeConstraints { make in
                make.centerX.equalTo(containerView.snp.centerX).offset(0)
                make.bottom.equalTo(containerView.snp.bottom).offset(0)
            }
            
            leftLikeImage.snp.makeConstraints { make in
                make.leading.equalTo(containerView.snp.leading).offset(0)
            }
            rightLikeImage.snp.makeConstraints { make in
                make.trailing.equalTo(containerView.snp.trailing).offset(0)
            }
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(containerView.snp.bottom).offset(100)
                make.leading.trailing.equalToSuperview().inset(60)
            }
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.trailing.leading.equalToSuperview().inset(30)
            }
            }
    }
