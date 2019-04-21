//
//  BottomNavModel.swift
//  BottomNav
//
//  Created by Santi on 18/04/2019.
//  Copyright © 2019 Santiago Franco. All rights reserved.
//

import Foundation
import UIKit

internal struct BottomNavModel {
    
    internal var icons: [UIImage] = []
    internal var titles: [String] = []
    
    public mutating func addItem(icon: UIImage, title: String = "") {
        icons.append(icon)
        titles.append(title)
    }
    
    
    internal var items: [(UIImage, String)] {
        return icons.enumerated().map {
            return ($1, titles[$0])
        }
    }
}
