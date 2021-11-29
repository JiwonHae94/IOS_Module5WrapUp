//
//  DataLoader.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import Foundation

func loadRemoteData() -> [Lesson] {
    let url = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json")
    
    guard url != nil else{
        return []
    }
    
    let request = URLRequest(url: url!)
    let session = URLSession.shared
    
    let task = session.dataTask(with:request){ (data, response, error) in
        
        guard error == nil else{
            return
        }
        
        do{
            let jsonDecoder = JSONDecoder()
            let lessons = try jsonDecoder.decode([Lesson].self, from: data!)
            
            return lessons ?? [Lesson]()
            
        }catch{
            //
            return [Lesson]()
        }
    }
    
    
}
