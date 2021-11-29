//
//  VideoView.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import SwiftUI
import AVKit

struct Video: View {
    @EnvironmentObject var model : SearchViewModel
    
    var body: some View {
        let lesson = model.currentLesson
        let videoURL = URL(fileURLWithPath: lesson?.videoURL ?? "")
        
        if videoURL != nil{
            VideoPlayer(player: AVPlayer(url: videoURL))
                .cornerRadius(10)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        Video()
    }
}
