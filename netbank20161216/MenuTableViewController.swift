//
//  MenuTableViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2017. 01. 24..
//  Copyright © 2017. Nagy, Valter. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
        var menuItems = ["Add Employee", "Show Employee List"]
        
        // MARK: - UITableViewDataSource
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
            
            cell.textLabel?.text = menuItems[indexPath.row]
            
            return cell
        }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var presentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController")
        if (indexPath.row == 0){
            presentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddEmployee")
        }
        if (indexPath.row == 1){
            presentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowEmployeeList")
        }
        
        self.navigationController?.pushViewController(presentVC, animated: true)
//        WelcomeViewController().menuGestureFunc()

     
        
        
    }
}
