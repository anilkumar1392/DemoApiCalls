//
//  NewsAdapter.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

class NewsApiAdapter: NewsLoader{
    func load(complition: @escaping (NewsLoader.Result) -> Void) {
        print("I'm here")
    }
}
