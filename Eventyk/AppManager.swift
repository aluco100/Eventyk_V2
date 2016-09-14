//
//  AppManager.swift
//  Eventyk
//
//  Created by Alfredo Luco on 14-09-16.
//  Copyright © 2016 Innovarco. All rights reserved.
//

import Foundation
import RealmSwift

public class AppManager: Object{
    //MARK: - Properties
    public dynamic var FirstTime: Bool = true
    //BaseURL can be changed
    private var BaseURL: String = "www.eventyk.com/api/"
    
    //MARK: - Initializer
    convenience required public init() {
        self.init()
    }
    
    //MARK: - Methods
    
}