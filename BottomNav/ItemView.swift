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
    
    let itemImage: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    
    let title: String
    let image: UIImage
    
    weak var delegate: ItemViewDelegate? = nil
    
    var color: UIColor = .black
    var isSelected: Bool = false {
        didSet {
            titleLabel.tintColor = self.isSelected ? self.tintColor : self.color
            itemImage.tintColor = self.isSelected ? self.tintColor : self.color
        }
    }
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        configureView()
    }
    
    fileprivate func configureView() {
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 12)
        
        self.addSubview(itemImage)
        if !title.isEmpty { self.addSubview(titleLabel) }
        
        putConstraints()
        update()
    }
    
    fileprivate func update() {
        self.itemImage.image = self.image
        self.titleLabel.text = self.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder not implemented")
    }
    
    fileprivate func putConstraints() {
        putImageConstraints()
        putTitleLabelConstraints()
    }
    
    fileprivate func putImageConstraints() {
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        itemImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        if title.isEmpty {
            itemImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        } else {
            itemImage.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        }
    }
    
    fileprivate func putTitleLabelConstraints() {
        guard !title.isEmpty else { return }
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 2).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    }
    
    @objc
    fileprivate func didTap() {
        self.delegate?.didTapItemView(self)
    }
}
