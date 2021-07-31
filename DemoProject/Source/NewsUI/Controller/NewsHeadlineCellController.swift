//
//  NewsHeadlineCellController.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation
import UIKit

class NewsHeadlineCellController {
    private var viewModel: NewsArticleViewModel? 
    private var headlineCell: NewsHeadlineCell?
    
    init(viewModel: NewsArticleViewModel) {
        self.viewModel = viewModel
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        let cell : NewsHeadlineCell = tableView.dequeueReusableCell()
        cell.headlineLabel.text = viewModel?.title
        return cell
    }
    
    func onSelection() -> NewsArticleViewModel?{
        guard let model = viewModel else {return nil}
        return model
    }
}
