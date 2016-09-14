//
//  Event.swift
//  Eventyk
//
//  Created by Alfredo Luco on 14-09-16.
//  Copyright © 2016 Innovarco. All rights reserved.
//

import Foundation
import RealmSwift

public class Event: Object{
    //MARK: - Properties
    private dynamic var Id: Int = 0
    public dynamic var Title: String = ""
    public dynamic var AssociatedPlace: Place? = nil
    public var People = List<User>()
    public dynamic var AssociatedTaste: Taste? = nil
    public dynamic var TaggedImage: String = ""
    public dynamic var Date: String = ""
    
    //MARK: - Initializer
    convenience init(id: Int, title: String, place: Place, visitors: List<User>, taste: Taste, image: String, date: String) {
        self.init()
        
        //Set the properties
        self.Id = id
        self.Title = title
        self.AssociatedPlace = place
        self.People = visitors
        self.AssociatedTaste = taste
        self.TaggedImage = image
        self.Date = date
        
    }
    
    //MARK: - Methods
    public func getId() ->  Int{
        return self.Id
    }
    
}