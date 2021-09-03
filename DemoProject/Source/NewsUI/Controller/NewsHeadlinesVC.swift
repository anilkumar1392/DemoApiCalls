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
        didSet { bind()}
    }
    
    var tableModel = [NewsHeadlineCellController]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        loadNews()
    }
}

//MARK: Setup View
extension NewsHeadlinesVC {
    func setupView(){
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func bind(){
    }
}

//MARK: UITableViewDataSource
extension NewsHeadlinesVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableModel[indexPath.row].view(in: tableView)
    }
}

//MARK: UITableViewDelegate
extension NewsHeadlinesVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailVCComposer.detailsComposedWith(viewModel:tableModel[indexPath.row].onSelection())
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Load News
extension NewsHeadlinesVC {
    func loadNews(){
        newsViewModel?.loadDataFromDB()
        newsViewModel?.loadNews()
    }
}
