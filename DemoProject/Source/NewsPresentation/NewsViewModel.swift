//
//  NewsViewModel.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

class NewsViewModel {
    typealias Observer<T> = (T) -> Void
    private var newsLoader : NewsLoader
    
    init(newsLoader: NewsLoader) {
        self.newsLoader = newsLoader
    }
    
    var onNewsLoad: Observer<[NewsResult]>?
    
    func loadNews(){
        print("Calling")
        newsLoader.load {[weak self](result) in
            print("reult")

            if let news = try? result.get(){
                self?.onNewsLoad?(news)
            }
        }
    }
}
