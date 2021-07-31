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
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    
    var viewModel: NewsImageViewModel<UIImage>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

}

extension NewsDetailVC {
    func setupView(){
        DispatchQueue.main.async {
            self.headingLabel.text = self.viewModel?.title
            self.subHeadingLabel.text = "\(kBy) \(self.viewModel?.author ?? "")"
            self.descLabel.text = self.viewModel?.description
            self.view.layoutIfNeeded()
        }
    }
    
    func loadImage(){
        
    }
}

