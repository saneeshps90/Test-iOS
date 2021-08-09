//
//  ModelData.swift
//  MindTech
//
//  Created by Saneesh Sathyavan on 09/08/21.
//

import Foundation

struct ModelData: Codable {
    
    var name : String
    var posterImage : String
    
    
    enum CodingKeys : String,CodingKey {
        case name = "name"
        case posterImage = "poster-image"
    }
    
}
