//
//  HeadlinesComposer.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation
import UIKit

final class HeadlineVCComposer {
    private init() {}
    public static func headlinesComposedWith(newsLoader: NewsLoader, imageLoader: NewsImageDataLoader) -> NewsHeadlinesVC {
        let newsViewModel = NewsViewModel(newsLoader: newsLoader)
        let vc = NewsHeadlinesVC.make(viewModel: newsViewModel)
        newsViewModel.onNewsLoad = adaptNewsToCellType(forwardingTo: vc, imageLoader: imageLoader)
        return vc
    }
    
    private static func adaptNewsToCellType(forwardingTo controller : NewsHeadlinesVC, imageLoader: NewsImageDataLoader) -> ([Article]) -> Void{
        return { [weak controller] news in
            controller?.tableModel = news.map { model in
                NewsHeadlineCellController(viewModel: NewsImageViewModel(model: model, imageLoader: imageLoader, imageTransformer: UIImage.init))
            }
        }
    }
}

private extension NewsHeadlinesVC {
    static func make(viewModel: NewsViewModel) -> NewsHeadlinesVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let headlinesVC = storyboard.instantiateViewController(withIdentifier: "NewsHeadlinesVC") as! NewsHeadlinesVC
        headlinesVC.newsViewModel = viewModel
        return headlinesVC
    }
}
