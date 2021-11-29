//
//  IOS_Module5WrapUpApp.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import SwiftUI

@main
struct IOS_Module5WrapUpApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(model: SearchViewModel())
        }
    }
}
