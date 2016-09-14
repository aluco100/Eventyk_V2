//
//  User.swift
//  Eventyk
//
//  Created by Alfredo Luco on 14-09-16.
//  Copyright © 2016 Innovarco. All rights reserved.
//

import Foundation
import RealmSwift
public class User: Object{
    //MARK: - Properties
    
    private dynamic var Mail: String = ""
    public dynamic var Name: String = ""
    private dynamic var Password: String = ""
    public dynamic var TaggedImage: String = ""
    public var ChosenTastes = List<Taste>()
    
    //MARK: - Initializer
    
    convenience init(mail: String, name:String, pass: String, image: String, tastes: List<Taste>){
        
        self.init()
        
        //set the properties
        
        self.Mail = mail
        self.Name = name
        self.Password = pass
        self.TaggedImage = image
        self.ChosenTastes = tastes
        
    }
    
    //MARK: - Methods
    
    public func getMail() -> String{
        return self.Mail
    }
    
    public func getPassword() -> String{
        return self.Password
    }
    
    
}