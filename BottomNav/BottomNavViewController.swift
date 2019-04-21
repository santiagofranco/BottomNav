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
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented")
    }
    
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
        bottomNav.translatesAutoresizingMaskIntoConstraints = false
        bottomNav.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant:0).isActive = true
        bottomNav.heightAnchor.constraint(equalToConstant: 64).isActive = true
        bottomNav.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 40).isActive = true
        bottomNav.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
    }
    
    fileprivate func showViewController(at index: Int) {
        guard let viewController = viewControllers[safe: index],
            viewController != self.currentViewController else {
            return
        }
        
        removeCurrentViewController()
        addViewController(viewController)
    }

    fileprivate func removeCurrentViewController() {
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
    }
    
    fileprivate func addViewController(_ vc: UIViewController) {
        addChild(vc)
        vc.didMove(toParent: self)
        self.currentViewController = vc
        self.view.insertSubview(vc.view, at: 0)
        self.loadViewIfNeeded()
    }

}

extension BottomNavViewController: BottomNavDelegate {
    func didTapItem(at index: Int) {
        showViewController(at: index)
    }
}
