//
//  NewsHeadlineCellController.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation
import UIKit

class NewsHeadlineCellController {
    private var viewModel: NewsImageViewModel<UIImage>
    private var headlineCell: NewsHeadlineCell?
    
    init(viewModel: NewsImageViewModel<UIImage>) {
        self.viewModel = viewModel
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        let cell : NewsHeadlineCell = tableView.dequeueReusableCell()
        cell.headlineLabel.text = viewModel.title
        cell.selectionStyle = .none
        return cell
    }
    
    func onSelection() -> NewsImageViewModel<UIImage>{
        return viewModel
    }
}
