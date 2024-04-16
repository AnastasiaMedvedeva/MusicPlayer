//
//  FirstCollectionViewCell.swift
//  OfflineMusicPlayer
//
//  Created by Анастасия on 16.04.2024.
//

import UIKit
import SnapKit

final class FirstCollectionViewCell: UICollectionViewCell {
// MARK: - GUI Variables
    private lazy var iconView: UIImage = {
        let image = UIImage()
        //image.images = UIImage(named: "image1")
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
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupUI() {
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        }
}
