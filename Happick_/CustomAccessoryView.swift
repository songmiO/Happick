//
//  CustomAccessoryView.swift
//  Happick_
//
//  Created by chole on 2021/02/28.
//  Copyright © 2021 Claire. All rights reserved.
//

import UIKit

class CustomAccessoryView: UIView {

    
  
    
        func instanceFromNib() -> CustomAccessoryView {
            return UINib(nibName: "CustomAccessoryView", bundle: nil)
                .instantiate(withOwner: nil, options: nil)
                .first as! CustomAccessoryView
        }
    
    }
    
    

