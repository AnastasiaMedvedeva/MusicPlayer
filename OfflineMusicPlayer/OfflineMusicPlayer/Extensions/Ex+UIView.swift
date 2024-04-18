//
//  Ex+UIImageView.swift
//  OfflineMusicPlayer
//
//  Created by Анастасия on 18.04.2024.
//

import Foundation
import UIKit

extension UIView {
        func addSubviews(_ views: [UIImageView]) {
            views.forEach { view in
                addSubview(view)
            }
        }
    }

