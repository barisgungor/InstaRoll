//
//  UserModel.swift
//  InstaRoll
//
//  Created by Barış Güngör on 14.06.2020.
//  Copyright © 2020 Barış Güngör. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel: Object {
    
     @objc dynamic var id: String?
     @objc dynamic var username: String?
     @objc dynamic var name: String?
     @objc dynamic var biography: String?
     @objc dynamic var thumbnail: URL?
     @objc dynamic var avatar: URL?
     @objc dynamic var isPrivate: Bool = false
     @objc dynamic var isVerified: Bool = false
     @objc dynamic var isBusiness: Bool = false
     @objc dynamic var followerCount: NSNumber?
     @objc dynamic var followingCount: NSNumber?
     @objc dynamic var mediaCount: NSNumber?
    
    override static func primaryKey() -> String? {
         return "id"
       }
    
}
