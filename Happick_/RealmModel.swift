//
//  RealmModel.swift
//  Happick_
//
//  Created by claire on 2020/06/05.
//  Copyright © 2020 Claire. All rights reserved.
//

import Foundation

import RealmSwift

class memoTable : Object {
    
    @objc dynamic var memoDay = Date()
    @objc dynamic var memoDate = Date()
    @objc dynamic var memoContents = ""
    @objc dynamic var memoID = 0
    @objc dynamic func primaryKey() -> String? {
       return "memoID"
    }
}
 
