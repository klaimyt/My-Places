//  PlaceModel.swift
//  MyPlaces
//
//  Created by Иван Клименков on 12/12/2019.
//  Copyright © 2019 Ivan klimenkov. All rights reserved.
//

import RealmSwift


class Place: Object {
    @objc dynamic var name = ""
    @objc dynamic var location = ""
    @objc dynamic var type = ""
    @objc dynamic var imageData = Data()
    @objc dynamic var date = Date()
    @objc dynamic var rating = 0.0
    
    convenience init(name: String, location: String?, type: String?, imageData: Data?, rating: Double) {
        self.init()
        self.name = name
        self.location = location!
        self.type = type!
        self.imageData = imageData!
        self.rating = rating
    }
}
