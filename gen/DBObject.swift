//
//  DBObject.swift
//  gen
//
//  Created by Alexis on 10/25/16.
//  Copyright © 2016 Alexis. All rights reserved.
//

struct GeneratorObject{
    var names: [String]
    var lastNames: [String]
    var middleNames:[String]
    var cities:[String]
    var streets:[String]
    var telephones:[String]
    var numberOfDigits:[Int]
    var postIndex:[String]
    
    init() {
        names=[]
        lastNames=[]
        middleNames=[]
        cities=[]
        streets=[]
        telephones=[]
        numberOfDigits=[]
        postIndex=[]
    }
}
