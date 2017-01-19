//
//  DBManager.swift
//  gen
//
//  Created by Alexis on 10/25/16.
//  Copyright © 2016 Alexis. All rights reserved.
//

import Foundation

class DBManager: NSObject {
    private var database: FMDatabase!
    
    
    init(pathToDatabase:String)
    {
        database = FMDatabase(path: pathToDatabase)
        database.open()
    }
    
    deinit {
        database.close()
    }
    
    func fillGenObj(fillTo: inout GeneratorObject){
        fillTo.cities=fillStringArr(table: "Cities", column: "city")
        fillTo.lastNames=fillStringArr(table: "LastNames", column: "last_name")
        fillTo.middleNames=fillStringArr(table: "MiddleNames", column: "middle_name")
        fillTo.names=fillStringArr(table: "Names", column: "name")
        fillTo.streets=fillStringArr(table: "Streets", column: "street")
        fillTo.telephones=fillStringArr(table: "Telephones", column: "telephone")
        fillTo.numberOfDigits=fillStringArr(table: "Telephones", column: "additionalDigits")
    }
    
    func fillStringArr(table:String, column:String) -> [String]{
        var resArr = [String]()
        let query = "select * from \(table)"
        do{
            let results =  try database.executeQuery(query, values: nil)
            while results.next() {
                resArr.append(results .string(forColumn: column))
            }
        }
        catch{
            print(error.localizedDescription)
        }
        return resArr;
    }
    
    private func fillStringArr(table:String, column:String) -> [Int]{
        var resArr = [Int]()
        let query = "select * from \(table)"
        do{
            let results =  try database.executeQuery(query, values: nil)
            while results.next() {
                resArr.append(Int(results.int(forColumn: column)))
            }
        }
        catch{
            print(error.localizedDescription)
        }
        return resArr;
    }
}
