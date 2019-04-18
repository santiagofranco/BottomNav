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

open class BottomNav: UIView {
    
    @IBOutlet weak var stackView: UIStackView!
    
    let model: BottomNavModel
    
    var mainColor: UIColor = .black
    weak var delegate: BottomNavDelegate? = nil
    
    fileprivate var items: [ItemView] = []
    
    internal lazy var itemViewFrame: CGRect = {
        CGRect(x: 0, y: 0, width: 0, height: self.bounds.height)
    }()
    
    init(frame: CGRect, model: BottomNavModel) {
        self.model = model
        super.init(frame: frame)
    }
    
    open override func awakeFromNib() {
        update(model: self.model)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init coder not implemented")
    }
    
    open func update(model: BottomNavModel) {
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
            stackView.addArrangedSubview(item)
            items.append(item)
        }
    }
    
    fileprivate func makeItemView(title: String, image: UIImage) -> ItemView {
        let itemView = ItemView(frame: itemViewFrame, title: title, image: image)
        itemView.color = self.mainColor
        itemView.delegate = self
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
