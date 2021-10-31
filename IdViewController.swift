//
//  IdViewController.swift
//  Happick_
//
//  Created by chole on 2021/06/06.
//  Copyright © 2021 Claire. All rights reserved.
//

import UIKit
import LocalAuthentication

class IdViewController: UIViewController {
    
    @IBAction func button(_ sender: Any) {
    let context:LAContext = LAContext()
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, erro: nim){
    context.evaluatePolicy(L)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
       
    

    
}
