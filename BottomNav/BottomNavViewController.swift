//
//  BottomNavViewController.swift
//  BottomNav
//
//  Created by Santi on 18/04/2019.
//  Copyright © 2019 Santiago Franco. All rights reserved.
//

import UIKit

open class BottomNavViewController: UIViewController {

    open var viewControllers: [UIViewController] = []
    open var icons: [UIImage] = []
    open var titles: [String] = []
    
    internal var currentViewController: UIViewController? = nil
    
    internal lazy var bottomNavFrame: CGRect = {
        CGRect(x: 0, y: 0, width: self.view.bounds.width - 20, height: 64)
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        createBottomNav()
        showViewController(at: 0)
    }
    
    fileprivate func createBottomNav() {
        let bottomNav = BottomNav(frame: bottomNavFrame, model: makeModel())
        bottomNav.delegate = self
        self.view.addSubview(bottomNav)
        putConstraints(to: bottomNav)
    }
    
    fileprivate func makeModel() -> BottomNavModel {
        var model = BottomNavModel()
        for (index, _) in self.viewControllers.enumerated() where index <= 5 {
            if let icon = icons[safe: index] {
                model.addItem(icon: icon, title: titles[safe: index] ?? "")
            }
        }
        return model
    }
    
    fileprivate func putConstraints(to bottomNav: BottomNav) {
        bottomNav.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.view.safeAreaInsets.bottom + 20)
        bottomNav.heightAnchor.constraint(equalToConstant: 64)
        bottomNav.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 40)
        bottomNav.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
    }
    
    fileprivate func showViewController(at index: Int) {
        guard let viewController = viewControllers[safe: index] else {
            return
        }
        
        removeCurrentViewController()
        addViewController(viewController)
    }

    fileprivate func removeCurrentViewController() {
        currentViewController?.removeFromParent()
    }
    
    fileprivate func addViewController(_ vc: UIViewController) {
        addChild(vc)
        vc.didMove(toParent: self)
        self.currentViewController = vc
        self.view = vc.view
        self.loadViewIfNeeded()
    }

}

extension BottomNavViewController: BottomNavDelegate {
    func didTapItem(at index: Int) {
        showViewController(at: index)
    }
}
