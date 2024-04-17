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
        return image
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 28)//Manrope
        label.text = "Your music library is always with you"//Add localization
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "gray")
        label.font = .systemFont(ofSize: 16)//Manrope
        label.text = "Search for any song and listen any time"//Add localization
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
    
    //MARK: - Private methods
    private func setupUI() {
        backgroundColor = .black
        setupConstraints()
    }
    
    private func setupConstraints() {
        iconView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconView.snp.bottom).offset(50)
            make.leading.trailing.equalTo(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalTo(20)
        }
        }
}
