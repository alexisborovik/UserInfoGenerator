//
//  ErrorMaker.swift
//  gen
//
//  Created by Alexis on 10/25/16.
//  Copyright © 2016 Alexis. All rights reserved.
//

import Foundation

class ErrorMaker
{
    private var errCount = 0.0
    private var errInc = 0.0
    
    init(errorsPerLine:Double) {
        errCount=errorsPerLine
        errInc=errorsPerLine
    }
    
    func setErrorsPerLine(errorsPerLine: Double) -> Void {
        errCount = errorsPerLine
        errInc = errorsPerLine
    }
    
    private func getErrorsCnt() -> Int{
        let cnt = floor(errCount)
        errCount -= cnt;
        errCount += errInc
        return Int(cnt)
    }
    
    
    //inout - speed - addres of the object
    
    private func getErrorIndex(stringTo:String) -> Int{
        var ind = arc4random_uniform(UInt32(stringTo.characters.count))
        if stringTo[stringTo.index(stringTo.startIndex, offsetBy: String.IndexDistance(ind))] == ";"
        {
            ind -= 1
        }
        return Int(ind)
    }
    
    private func removeCharAt(stringTo: inout String, index:Int) {
        stringTo.remove(at: stringTo.index(stringTo.startIndex, offsetBy: String.IndexDistance(index)))
    }
    
    private func getRandomChar(stringTo:inout String) -> Character{
        var ind = arc4random_uniform(UInt32(stringTo.characters.count))
        if stringTo[stringTo.index(stringTo.startIndex, offsetBy: String.IndexDistance(ind))] == ";"
        {
            ind -= 1
        }
        return stringTo[stringTo.index(stringTo.startIndex, offsetBy: String.IndexDistance(ind))]
    }
    
    private func addNewCharAt( stringTo:inout String, index: Int) {
        let ch = getRandomChar(stringTo: &stringTo)
        let ind = stringTo.index(stringTo.startIndex, offsetBy: String.IndexDistance(index))
        stringTo.insert(ch, at: ind)
    }
    
    private func doubleChar(stringTo:inout String, index: Int)
    {
        let ind = stringTo.index(stringTo.startIndex, offsetBy: String.IndexDistance(index))
        stringTo.insert(stringTo[ind], at: stringTo.index(ind, offsetBy: String.IndexDistance(1)))
    }

    func getStringWithErrors(stringTo: inout String) {
        var numOfErr = getErrorsCnt()
        while numOfErr > 0
        {
            addNewCharAt(stringTo: &stringTo, index: getErrorIndex(stringTo: stringTo))
            numOfErr -= 1
        }
    }
    
    
}
