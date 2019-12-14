//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Иван Клименков on 14/12/2019.
//  Copyright © 2019 Ivan klimenkov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
     
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}
