//
//  NewsDetailVCComposer.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation
import UIKit

final class NewsDetailVCComposer {
    static func detailsComposedWith(viewModel: NewsImageViewModel<UIImage>) -> NewsDetailVC {
        let vc = NewsDetailVC.make(viewModel: viewModel)
        return vc
    }
}

extension NewsDetailVC {
    static func make(viewModel : NewsImageViewModel<UIImage>) -> NewsDetailVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        detailVC.viewModel = viewModel
        return detailVC
    }
}
