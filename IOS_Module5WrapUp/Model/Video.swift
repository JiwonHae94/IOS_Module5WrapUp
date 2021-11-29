//
//  Data.swift
//  IOS_Module5WrapUp
//
//  Created by Jiwon_Hae on 2021/11/29.
//

import Foundation

struct Video : Decodable, Identifiable {
    var id : Int
    var title, url : String
}
