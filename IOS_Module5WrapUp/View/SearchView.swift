//
//  SearchView.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var model : SearchViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            List{
                SearchBar(text: $searchText)
                ForEach(model.videos){ video in
                    NavigationLink(video.title) {
                        PlayerView(video: video)
                    }
                }
            }
            .navigationBarTitle(Text("All Videos"))
            .onChange(of: searchText) { text in
                model.filterVideos(text)
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(
            model: SearchViewModel())
    }
}
