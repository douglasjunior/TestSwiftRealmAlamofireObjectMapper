//
//  Vehicle.swift
//  TestRealm
//
//  Created by Douglas Nassif Roma Junior on 09/11/16.
//  Copyright © 2016 Douglas Nassif Roma Junior. All rights reserved.
//

import Foundation
import RealmSwift

class Vehicle: Object {
    
    // Specify properties to ignore (Realm won't persist these)
    
    //  override static func ignoredProperties() -> [String] {
    //    return []
    //  }
    
    dynamic var id = 0;
    dynamic var model = "";
    dynamic var year = 0;
    let wheels = List<Wheel>();
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["model"]
    }
}
