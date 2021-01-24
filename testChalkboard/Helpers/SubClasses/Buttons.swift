//
//  Buttons.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation
import UIKit

final class BackButton: UIButton {
    
    override func awakeFromNib() {
        setupStyle()
    }
    
    func setupStyle() {
        backgroundColor = .clear
        titleLabel?.font =  UIFont.boldSystemFont(ofSize: 14)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 2
    }
}
