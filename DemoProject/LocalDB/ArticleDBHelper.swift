//
//  ArticleDBHelper.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation
import CoreData

class ArticleDBHelper {
    class func saveArticles(articles: [Article], onComplition: @escaping () -> Void){
        for article in articles {
            let newArticleObj = Articles(context: DBHelper.shared.context)
            newArticleObj.author = article.author
            newArticleObj.title = article.title
            newArticleObj.articleDescription = article.articleDescription
            newArticleObj.url = article.url
            newArticleObj.urlToImage = article.urlToImage
            newArticleObj.publishedAt = article.publishedAt
            newArticleObj.content = article.content
        }
        DBHelper.shared.saveContext()
        onComplition()
    }
}


extension ArticleDBHelper {
    class func getArticels() -> [Articles]{
        do {
            let fetchArticle = NSFetchRequest<NSManagedObject>(entityName: kArticles)
            let result = try DBHelper.shared.context.fetch(fetchArticle)
            guard let articels = result as? [Articles] else {
                return []
            }
            return articels
        } catch  {
            return []
        }
    }
}

extension ArticleDBHelper {
    class func mapDBArticlesToArticle(articles: [Articles]) -> [Article]{
        var articleArr = [Article]()
        for article in articles {
            articleArr.append(Article(source: nil, author: article.author, title: article.title, articleDescription: article.articleDescription, url: article.url, urlToImage: article.urlToImage, publishedAt: article.publishedAt, content: article.content))
        }
        return articleArr
    }
}
