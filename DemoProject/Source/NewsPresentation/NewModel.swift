//
//  NewModel.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

struct NewsResult: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [Articles]
}

struct Articles: Decodable{
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?
    var source : Source
}

struct Source: Decodable{
    var id: Int?
    var name: String?
}
