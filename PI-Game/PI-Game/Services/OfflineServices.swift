//
//  ReadPIFileService.swift
//  PI-Game
//
//  Created by Ahmed Salem on 07/02/2023.
//

import Foundation

class OfflineServices
{
    public static var PIDigits : String? = readPIFile()

}

func readPIFile() -> String?{
    var PITXT:String?
    
    let path = Bundle.main.path(forResource: "PI", ofType: "txt")
    
    do{
        PITXT = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
    }catch{
        PITXT = ""
    }
    return PITXT
}
