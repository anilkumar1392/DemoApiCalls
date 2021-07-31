//
//  NewsImageViewModel.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation

final class NewsImageViewModel<Image> {
    typealias Observer<T> = (T) -> Void
    
    private var task: NewsImageDataLoaderTask?
    private let model: Article
    private let imageLoader: NewsImageDataLoader
    private let imageTransformer: (Data) -> Image?
    
    init(model: Article, imageLoader: NewsImageDataLoader, imageTransformer: @escaping (Data) -> Image?) {
        self.model = model
        self.imageLoader = imageLoader
        self.imageTransformer = imageTransformer
    }
    
    var title: String?{
        return model.title
    }
    
    var description: String?{
        return model.articleDescription
    }
    
    var content: String?{
        return model.content
    }
    
    var author: String?{
        return model.author
    }
    
    var onImageLoad: Observer<Image>?

    func loadImageData(){
        guard let imageUrl = model.urlToImage else {return}
        guard let urlRequest = URL(string: imageUrl) else {return}
        task = imageLoader.loadImageData(from: urlRequest, completion: { [weak self] (result) in
            self?.handleResult(result)
        })
    }
    
    private func handleResult(_ result: NewsImageDataLoader.Result){
        if let image = (try? result.get()).flatMap(imageTransformer) {
            onImageLoad?(image)
        }
    }
}
