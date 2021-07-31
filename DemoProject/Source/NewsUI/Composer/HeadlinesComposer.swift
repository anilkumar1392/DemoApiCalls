//
//  HeadlinesComposer.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation
import UIKit

final class HeadlineComposer {
    private init() {}
    public static func headlinesComposedWith(newsLoader: NewsLoader) -> NewsHeadlinesVC {
        let newsViewModel = NewsViewModel(newsLoader: newsLoader)
        let vc = NewsHeadlinesVC.make(viewModel: newsViewModel)
        newsViewModel.onNewsLoad = adaptNewsToCellType(forwardingTo: vc)
        return vc
    }
    
    private static func adaptNewsToCellType(forwardingTo controller : NewsHeadlinesVC) -> ([Article]) -> Void{
        return { [weak controller] news in
            print(news)
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
