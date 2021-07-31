//
//  NewsHeadlinesVC.swift
//  DemoProject
//
//  Created by mac on 31/07/21.
//

import UIKit

class NewsHeadlinesVC: UIViewController {

    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var newsViewModel: NewsViewModel?{
        didSet {
            bind()
        }
    }
    
    //MARK: View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadNews()
    }
}

//MARK: Setup View
extension NewsHeadlinesVC {
    func setupView(){
        self.title = "Home"
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func bind(){
        
    }
}

//MARK: UITableViewDataSource
extension NewsHeadlinesVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell");
        cell.textLabel?.text = "Anil"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

//MARK: UITableViewDelegate
extension NewsHeadlinesVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: Load News
extension NewsHeadlinesVC {
    func loadNews(){
        newsViewModel?.loadNews()
    }
}
