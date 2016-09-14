//
//  Taste.swift
//  Eventyk
//
//  Created by Alfredo Luco on 14-09-16.
//  Copyright © 2016 Innovarco. All rights reserved.
//

import Foundation
import RealmSwift

public class Taste: Object{
    //MARK: - Properties
    private dynamic var Id: Int = 0
    public dynamic var Name: String = ""
    public dynamic var TaggedImage: String = ""
    
    //MARK: - Initializer
    convenience init(id: Int, name: String, image: String) {
        //Set the properties
        self.init()
        
        self.Id = id
        self.Name = name
        self.TaggedImage = image
        
        
    }
}