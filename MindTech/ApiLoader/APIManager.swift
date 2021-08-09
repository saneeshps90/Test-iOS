//
//  APIManager.swift
//  MindTech
//
//  Created by Saneesh Sathyavan on 09/08/21.
//

import Foundation

public class ApiManager {
    
    var movieList = [ModelData]()
    
    func loadData() -> [ModelData]{
        if let fileLocation = Bundle.main.url(forResource: "Content", withExtension:"json"){
            do{
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let datafromJson = try jsonDecoder.decode([ModelData].self, from: data)
                self.movieList = datafromJson
        
            }catch{
                print(error)
            }
        }
        return self.movieList
    }
}
