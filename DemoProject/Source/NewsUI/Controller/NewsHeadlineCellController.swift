//
//  NewsHeadlineCellController.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import Foundation
import UIKit

class NewsHeadlineCellController {
    private var viewModel: NewsHeadline?
    private var headlineCell: NewsHeadlineCell?
    
    init(viewModel: NewsHeadline) {
        self.viewModel = viewModel
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        let cell : NewsHeadlineCell = tableView.dequeueReusableCell()
        cell.headlineLabel.text = viewModel?.headline
        return cell
    }
}
