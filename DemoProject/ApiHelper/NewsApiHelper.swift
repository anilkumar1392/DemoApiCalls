//
//  NewsApiHelper.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

class NewsApiHelper: NewsLoader{
    var serviceHelper = ServiceHelper()
    func load(complition: @escaping (NewsLoader.Result) -> Void) {
        serviceHelper.request(param: [:], methodType: .get, apiName: newsApiUrl) { (result) in
            switch result {
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(NewsResult.self, from: data as! Data)
                    complition(.success(results.articles ?? []))
                } catch {
                    print(error)
                    complition(.failure(error))
                }
            case .failure(let error):
                print("Something went wrong \(error)")
            }
        }
    }
}

