//
//  LessonViewModel.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import Foundation

class SearchViewModel : ObservableObject{
    @Published
    var videos = [Video]()
    
    var allVideos = [Video]()
    
    init() {
        self.getRemoteData()
    }
    
    func filterVideos(_ searchText: String){
        videos = allVideos.filter({ searchText.isEmpty ? true:
            $0.title.localizedCaseInsensitiveContains(searchText)
        })
    }
    
    func getRemoteData(){
        guard let url = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data, let videos = try? JSONDecoder().decode([Video].self, from: data) {

                self.allVideos = videos

                DispatchQueue.main.async {
                    self.videos = videos
                }

            }
        }
        .resume()

    }
    
}
