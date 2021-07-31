//
//  NewsDetailVC.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import UIKit

class NewsDetailVC: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var HeadingLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    
    var viewModel: NewsArticleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


