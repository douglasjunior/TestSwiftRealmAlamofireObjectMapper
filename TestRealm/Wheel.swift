//
//  Wheel.swift
//  TestRealm
//
//  Created by Douglas Nassif Roma Junior on 09/11/16.
//  Copyright © 2016 Douglas Nassif Roma Junior. All rights reserved.
//

import Foundation
import RealmSwift

class Wheel: Object {
    
    // Specify properties to ignore (Realm won't persist these)
    
    //  override static func ignoredProperties() -> [String] {
    //    return []
    //  }
    
    dynamic var id = 0;
    dynamic var number = 0;
    dynamic var name = "teste";
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["number"]
    }
}
