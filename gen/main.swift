//
//  main.swift
//  gen
//
//  Created by Alexis on 10/25/16.
//  Copyright © 2016 Alexis. All rights reserved.
//

import Foundation

let inputArray=CommandLine.arguments
if inputArray.count<4 || inputArray.count>4{
    print("Error in args")
}else{
   let strgen=StringGenerator(lang: inputArray[1].uppercased(), errPerStr: Double(inputArray[2])!)
   strgen.generateStrings(number: Int(inputArray[3])!)
}
