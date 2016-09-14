//
//  Place.swift
//  Eventyk
//
//  Created by Alfredo Luco on 14-09-16.
//  Copyright © 2016 Innovarco. All rights reserved.
//

import Foundation
import RealmSwift

public class Place: Object{
    //MARK: - Properties
    private dynamic var Id: Int = 0
    public dynamic var Name: String = ""
    public dynamic var Address: String = ""
    public dynamic var Latitude: Float = 0.0
    public dynamic var Longitude: Float = 0.0
    
    //MARK: - Initializer
    convenience init(id: Int, name: String, address: String) {
        self.init()
        
        //set the properties
        self.Id = id
        self.Name = name
        self.Address = address
        
        //TODO: get the lat and lon and set them
    }
    
    //MARK: - Methods
    public func getId() -> Int{
        return self.Id
    }
    
}