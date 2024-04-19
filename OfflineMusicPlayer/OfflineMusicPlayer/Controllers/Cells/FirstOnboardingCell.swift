//
//  FirstCollectionViewCell.swift
//  OfflineMusicPlayer
//
//  Created by Анастасия on 16.04.2024.
//

import UIKit
import SnapKit

final class FirstOnboardingCell: UICollectionViewCell {
// MARK: - GUI Variables
    private lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.layer.position = center
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
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Methods
    func setup(_ slide: OnboardingSlide) {
        iconView.image = slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
    //MARK: - Private methods
    private func setupUI() {
        backgroundColor = .black
        setupConstraints()
    }
    
    private func setupConstraints() {
        iconView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-75)
            make.trailing.leading.equalToSuperview().inset(30)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconView.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(60)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(30)
        }
        }
}
