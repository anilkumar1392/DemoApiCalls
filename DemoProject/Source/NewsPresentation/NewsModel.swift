//
//  NewModel.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

struct NewsResult: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Decodable{
    let source: Source?
    let author: String?
    let title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

struct Source: Decodable{
    let id: String?
    let name: String?
}
