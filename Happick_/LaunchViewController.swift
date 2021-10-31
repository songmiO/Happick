//
//  LaunchViewController.swift
//  Happick_
//
//  Created by chole on 2021/01/11.
//  Copyright © 2021 Claire. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delay(0.5, closure: <#T##() -> ()#>)
   
    }
        func delay(_ delay:Double, closure:@escaping ()->()) {
            let when = DispatchTime.now() + delay
            DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
        }

}
