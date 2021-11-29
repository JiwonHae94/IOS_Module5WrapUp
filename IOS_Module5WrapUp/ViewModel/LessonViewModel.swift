//
//  LessonViewModel.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import Foundation

class LessonViewModel : ObservableObject{
    @Published
    var lessons = [Lesson]()
    
    @Published
    var currentLesson : Lesson? = nil
    
    init() {
        getRemoteData()
    }
    
    func getRemoteData(){
        let url = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json")
        
        guard url != nil else{
            return
        }
        
        let req = URLRequest(url:url!)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: req) { (data, response, error) in
            
            guard error != nil else {
                return
            }
            
            do{
                let jsonDecoder = JSONDecoder()
                let remoteLessons = jsonDecoder.decode([Lesson].self, from: data!)
                
                DispatchQueue.main.async {
                    self.lessons += remoteLessons
                }
            } catch{
                //
            }
            
        }
    }
    
}
