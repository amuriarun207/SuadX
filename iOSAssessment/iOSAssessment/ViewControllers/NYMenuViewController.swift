//
//  NYMenuViewController.swift
//  iOSAssessment
//
//  Created by Amuri Arun Kumar on 27/8/19.
//  Copyright © 2019 Amuri Arun Kumar. All rights reserved.
//

import UIKit

class NYMenuViewController: NYBaseViewController{

    @IBOutlet weak var menuTableView: UITableView! //we can use baseview Tableview controller 
    let  menuOptions :[String]  = ["Menu1","Menu2","Menu3"]
    fileprivate struct Constants{
        static let NYMenuTVCell = "NYMenuTVCell"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
    }
    

}
extension NYMenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return menuOptions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if let cell = tableView.dequeueReusableCell(withIdentifier:Constants.NYMenuTVCell, for: indexPath) as? NYMenuTVCell{
            cell.menuTitleLabel.text = menuOptions[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
extension NYMenuViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.findHamburguerViewController()?.hideMenuViewControllerWithCompletion({
            print("[NYMenuViewController] dismissed successfully")
        })
    }
}
