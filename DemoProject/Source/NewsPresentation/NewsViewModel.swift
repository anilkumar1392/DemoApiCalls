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
    
    var onNewsLoad: Observer<[Article]>?

    func loadNews(){
        newsLoader.load {[weak self](result) in
            if let news = try? result.get(){
                self?.onNewsLoad?(news)
            }
        }
    }
    
    func loadDataFromDB(){
        let articles = ArticleDBHelper.getArticels()
        self.onNewsLoad?(ArticleDBHelper.mapDBArticlesToArticle(articles: articles))
    }
}
