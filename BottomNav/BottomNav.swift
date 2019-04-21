//
//  BottomNav.swift
//  BottomNav
//
//  Created by Santi on 18/04/2019.
//  Copyright © 2019 Santiago Franco. All rights reserved.
//

import Foundation
import UIKit

internal protocol BottomNavDelegate: class {
    func didTapItem(at index: Int)
}

internal class BottomNav: UIView {
    
    let stackView: UIStackView = UIStackView()
    let model: BottomNavModel
    
    var mainColor: UIColor = .black
    weak var delegate: BottomNavDelegate? = nil
    
    fileprivate var items: [ItemView] = []
    
    init(frame: CGRect, model: BottomNavModel) {
        self.model = model
        super.init(frame: frame)
        self.backgroundColor = .white

        self.layer.cornerRadius = self.bounds.height / 2
        
        configureShadow()
        
        self.stackView.distribution = .fillEqually
        self.addSubview(stackView)
        putContraintsToStackView()
        update()
    }
    
    fileprivate func configureShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
        self.layer.shouldRasterize = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init coder not implemented")
    }
    
    fileprivate func putContraintsToStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: self.bounds.width - 30).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: self.bounds.height).isActive = true
    }
    
    open func update() {
        cleanItems()
        populateStackView()
    }
    
    fileprivate func cleanItems() {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        items.removeAll()
    }
    
    fileprivate func populateStackView() {
        model.items.forEach { (image, title) in
            let item = makeItemView(title: title, image: image)
            item.tintColor = .yellow
            stackView.addArrangedSubview(item)
            items.append(item)
        }
    }
    
    fileprivate func makeItemView(title: String, image: UIImage) -> ItemView {
        let itemView = ItemView(title: title, image: image)
        itemView.color = self.mainColor
        itemView.delegate = self
        itemView.heightAnchor.constraint(equalToConstant: self.bounds.height).isActive = true
        return itemView
    }

}

extension BottomNav: ItemViewDelegate {
    func didTapItemView(_ itemView: ItemView) {
        guard let index = items.firstIndex(where: { (item) -> Bool in
            return item == itemView
        }) else { return }
        
        items.forEach {
            itemView.isSelected = $0 == itemView
        }
        self.delegate?.didTapItem(at: index)
    }
}
