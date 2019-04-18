//
//  ItemView.swift
//  BottomNav
//
//  Created by Santi on 18/04/2019.
//  Copyright © 2019 Santiago Franco. All rights reserved.
//

import Foundation
import UIKit


internal protocol ItemViewDelegate: class {
    func didTapItemView(_ itemView: ItemView)
}

internal class ItemView: UIView {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let title: String
    let image: UIImage
    
    weak var delegate: ItemViewDelegate? = nil
    
    var color: UIColor = .black
    var isSelected: Bool = false {
        didSet {
            titleLabel.tintColor = self.isSelected ? self.tintColor : self.color
        }
    }
    
    init(frame: CGRect, title: String, image: UIImage) {
        self.title = title
        self.image = image
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init code not implemented")
    }
    
    override func awakeFromNib() {
        titleLabel.text = self.title
        itemImage.image = self.image
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    @objc
    fileprivate func didTap() {
        self.delegate?.didTapItemView(self)
    }
}
