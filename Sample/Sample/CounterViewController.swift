//
//  CounterViewController.swift
//  Sample
//
//  Created by Santi on 19/04/2019.
//  Copyright © 2019 Santiago Franco. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {

    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("did load \(String(describing:self.view.backgroundColor))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("did appear \(String(describing:self.view.backgroundColor))")
        print("counter \(counter)")
        counter += 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
