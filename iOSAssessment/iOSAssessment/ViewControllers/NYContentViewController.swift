//
//  NYContentViewController.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import UIKit
import PINRemoteImage

class NYContentViewController: UIViewController {
    
    @IBOutlet weak var newsActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mostPopularNewsTableView: UITableView!
    private var dataHandler: MostPopularDataHandler!
    fileprivate var selectedSection = Router.viewed
    fileprivate struct Constants{
        static let NYMostPopularTVCell = "NYMostPopularTVCell"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NY Times Most Popular"
        mostPopularNewsTableView.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadMostPopularNews()
    }
    
    private func loadMostPopularNews(){
        newsActivityIndicator.startAnimating()
        dataHandler = MostPopularDataHandler()
        
        dataHandler.loadMostPopularNews(for: selectedSection, period: 7) { (result) in
            DispatchQueue.main.async {
                self.newsActivityIndicator.stopAnimating()
                self.mostPopularNewsTableView.reloadData()
            }
        }
    }
    
    @IBAction private func menuButtonClicked(_ sender: Any) {
        self.findHamburguerViewController()?.showMenuViewController()
    }
    
    @IBAction private func actionButtonClicked(_ sender: Any) {
        showActionSheet()
    }
}
extension NYContentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let  results = self.dataHandler?.mostPopularNewsdetails?.results{
            return results.count
        }
        return 0
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:Constants.NYMostPopularTVCell, for: indexPath) as? NYMostPopularTVCell {
            if let results = dataHandler.mostPopularNewsdetails?.results {
                cell.configureCell(data: results[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
    
}
extension NYContentViewController: UITableViewDelegate {
    
}


extension NYContentViewController {
    
    func showActionSheet() {
        let alert = UIAlertController(title: "Choose Option", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Emailed", style: .default , handler:{ (UIAlertAction)in
            self.selectedSection = Router.emailed
            self.loadMostPopularNews()
        }))
        
        alert.addAction(UIAlertAction(title: "Viewed", style: .default , handler:{ (UIAlertAction)in
            self.selectedSection = Router.viewed
            self.loadMostPopularNews()
        }))
        
        alert.addAction(UIAlertAction(title: "Shared", style: .default , handler:{ (UIAlertAction)in
            self.selectedSection = Router.shared
            self.loadMostPopularNews()
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("canceled")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
    }
}
