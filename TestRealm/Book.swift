//
//  Book.swift
//  TestSwiftRealmAlamofireObjectMapper
//
//  Created by Douglas Nassif Roma Junior on 16/11/16.
//  Copyright © 2016 Douglas Nassif Roma Junior. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Book: Object, Mappable {
    
    dynamic var id = 0
    dynamic var title = ""
    dynamic var autor = ""
    dynamic var genre = ""
    
    //Impl. of Mappable protocol
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id    <- map["id"]
        title <- map["title"]
        autor <- map["autor"]
        genre <- map["genre"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}