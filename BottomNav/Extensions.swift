//
//  Extensions.swift
//  BottomNav
//
//  Created by Santi on 18/04/2019.
//  Copyright © 2019 Santiago Franco. All rights reserved.
//

import Foundation


extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
