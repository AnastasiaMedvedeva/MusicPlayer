//
//  Ex+UILabel.swift
//  OfflineMusicPlayer
//
//  Created by Анастасия on 18.04.2024.
//

import Foundation
import UIKit

extension UIView {
        func addSubviews(_ views: [UILabel]) {
            views.forEach { view in
                addSubview(view)
            }
        }
    }
