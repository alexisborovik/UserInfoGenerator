//
//  StringGenerator.swift
//  gen
//
//  Created by Alexis on 10/26/16.
//  Copyright © 2016 Alexis. All rights reserved.
//

import Foundation

class StringGenerator
{
    private var pathToDatabase:String
    private var documentsDirectory: String
    private var databaseObject: GeneratorObject
    private var errorsPerString: Double
    private var errM: ErrorMaker
    
    init(lang: String, errPerStr: Double) {
        documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(lang).sqlite")
        databaseObject = GeneratorObject()
        errorsPerString = errPerStr
        errM = ErrorMaker(errorsPerLine: errorsPerString)
        fillGenObject()
    }
    
    func setNewLang(lang: String)
    {
        pathToDatabase = documentsDirectory.appending("/\(lang).sqlite")
        fillGenObject()
    }
    
    func setNewErrPerLine(num: Double){
        errM.setErrorsPerLine(errorsPerLine: num)
    }
    
    private func fillGenObject(){
        let db = DBManager(pathToDatabase: pathToDatabase)
        db.fillGenObj(fillTo: &databaseObject)
    }
    
    private func getName(databaseObj: inout GeneratorObject) -> String
    {
        let ind = Int(arc4random_uniform(UInt32(databaseObj.names.count)))
        return databaseObj.names[ind]
    }
    
    private func getLastName(databaseObj: inout GeneratorObject) -> String
    {
        let ind = Int(arc4random_uniform(UInt32(databaseObj.lastNames.count)))
        return databaseObj.lastNames[ind]
    }
    
    private func getMiddleName(databaseObj: inout GeneratorObject) -> String
    {
        let ind = Int(arc4random_uniform(UInt32(databaseObj.middleNames.count)))
        return databaseObj.middleNames[ind]
    }
    
    private func getCity(databaseObj: inout GeneratorObject) -> String
    {
        let ind = Int(arc4random_uniform(UInt32(databaseObj.cities.count)))
        return databaseObj.cities[ind]
    }
    
    private func getStreet(databaseObj: inout GeneratorObject) -> String
    {
        let ind = Int(arc4random_uniform(UInt32(databaseObj.streets.count)))
        return databaseObj.streets[ind]
    }
    
    private func getPhoneNumber(databaseObj: inout GeneratorObject) -> String{
        let ind = Int(arc4random_uniform(UInt32(databaseObj.telephones.count)))
        var s=databaseObj.telephones[ind]
        var sind = databaseObj.numberOfDigits[ind]
        while sind>0{
            s.append(String(arc4random_uniform(10)))
            sind-=1
        }
        return s
    }
    
    private func getHouseNumber() -> String{
        return String(arc4random_uniform(100))
    }
    
    private func getFlatNumber() -> String{
        return getHouseNumber()
    }
    
    private func getPostCode(length: Int) -> String{
        var res = ""
        for _ in 0..<length{
            res.append(String(arc4random_uniform(10)))
        }
        return res
    }
    
    private func getNewString(s:inout String)
    {
        s="\(getLastName(databaseObj: &databaseObject)) \(getName(databaseObj: &databaseObject)) \(getMiddleName(databaseObj: &databaseObject)); \(getPostCode(length: 6)), \(getCity(databaseObj: &databaseObject)), \(getStreet(databaseObj: &databaseObject)), \(getHouseNumber()), \(getFlatNumber()); \(getPhoneNumber(databaseObj: &databaseObject));"
    }
    
    func generateStrings(number: Int){
        var resultString = String()
        for _ in 0..<number
        {
            getNewString(s: &resultString)
            errM.getStringWithErrors(stringTo: &resultString)
            print(resultString)
        }
    }
}
