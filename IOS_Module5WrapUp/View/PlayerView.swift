//
//  PlayerView.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    let video: Video
    let aspectRatio: CGFloat = 478 / 849
    
    var body: some View {
        if let url = URL(string: video.url) {
            VStack(alignment: .leading) {
                Text(video.title)
                    .font(.title)
                    .bold()
                    .padding()
                
                GeometryReader { geo in
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geo.size.width * aspectRatio)
                }
            }
            
        } else {
            Text("Whoops! Looks like we're having some trouble loading your video right now.")
                .font(.title2)
                .padding()
        }
    }

}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(video: Video(id: 1, title: "Video Title", url: "https://codewithchris.github.io/Module5Challenge/Lesson%201.mp4"))

    }
}
