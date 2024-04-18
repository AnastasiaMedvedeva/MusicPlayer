//
//  FourthOnboardingCell.swift
//  OfflineMusicPlayer
//
//  Created by Анастасия on 16.04.2024.
//

import UIKit
import SnapKit

final class FourthOnboardingCell: UICollectionViewCell {
    // MARK: - GUI Variables
        private lazy var iconView: UIImageView = {
            let view = UIImageView()
            view.backgroundColor = UIColor(named: "purple")
            view.layer.cornerRadius = 10
            view.layer.position = center
            return view
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
    private lazy var freeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
//        label.font = .boldSystemFont(ofSize: 16)
        label.font = UIFont(name: "Manrope-Regular", size: 16)
        return label
    }()
        private lazy var priceLabel: UILabel = {
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
            addSubview(freeLabel)
            addSubview(priceLabel)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        // MARK: - Methods
    func setup(_ slide: OnboardingSlide) {
        iconView = slide.view ?? UIImageView()
            titleLabel.text = slide.title
        priceLabel.text = slide.description
        freeLabel.text = slide.freeLabel
        
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
            freeLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.trailing.leading.equalToSuperview().inset(30)
            }
            priceLabel.snp.makeConstraints { make in
                make.top.equalTo(freeLabel.snp.bottom).offset(5)
                make.trailing.leading.equalToSuperview().inset(30)
            }
            
            }
    }

