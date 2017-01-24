//
//  MenuPopUpViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2017. 01. 19..
//  Copyright © 2017. Nagy, Valter. All rights reserved.
//

import UIKit

class MenuPopUpViewController: UIViewController {

    
    
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func WelcomeScreenButton(_ sender: Any) {
        self.view.removeFromSuperview()
        Util.openViewController(DisplayVC: "WelcomeViewController")
    }

    @IBAction func AddEmployeeButton(_ sender: Any) {
        self.view.removeFromSuperview()
        Util.openViewController(DisplayVC: "AddEmployee")
    }

    @IBAction func showEmployeeListButton(_ sender: Any) {
        self.view.removeFromSuperview()
        Util.openViewController(DisplayVC: "ShowEmployeeList")
    }
    


}
