//
//  PasswordViewController.swift
//  Happick_
//
//  Created by chole on 2021/04/21.
//  Copyright © 2021 Claire. All rights reserved.
//

import UIKit
import LocalAuthentication
class PasswordViewController: UIViewController {

 
    
    @IBOutlet weak var smile1Image: UIImageView!
    
    @IBOutlet weak var smile2Image: UIImageView!
    
    @IBOutlet weak var smile3Image: UIImageView!
    
    @IBOutlet weak var smile4Image: UIImageView!
    
    
    
    let correctPasscode = [1, 2, 3, 4]
    var guessPasscode = [Int]()
    

    
    let newImg1: UIImage? = UIImage(named: "smile1")
    let newImg2: UIImage? = UIImage(named: "smile2")
    let newImg3: UIImage? = UIImage(named: "smile3")
    let newImg4: UIImage? = UIImage(named: "smile4")
    
    var count: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    }
    
   
   
    @IBAction func num(_ sender: UIButton) {
        let num : Int = Int(sender.tag)
        print(num)
        guessPasscode.append(num)
        print(guessPasscode)
        
        count += 1
        if(count == 1) {smile1Image.image = newImg1}
        else if(count == 2) {smile2Image.image = newImg2}
        else if(count == 3) {smile3Image.image = newImg3}
        else if(count == 4) {
            smile4Image.image = newImg4
            if correctPasscode == guessPasscode {
                print("동일하다")
            } else {
                print("오답입니다")
            }
        }
    }
}
