//
//  VideoView.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import SwiftUI
import AVKit

struct VideoView: View {
    @EnvironmentObject var viewmodel : LessonViewModel
    
    var body: some View {
        let lesson = viewmodel.currentLesson
        let videoURL = URL(fileURLWithPath: lesson?.videoURL ?? "")
        
        if videoURL != nil{
            VideoPlayer(player: AVPlayer(url: videoURL))
                .cornerRadius(10)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
