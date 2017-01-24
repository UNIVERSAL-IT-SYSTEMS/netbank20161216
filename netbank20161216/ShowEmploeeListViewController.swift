//
//  ShowEmploeeListViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2017. 01. 20..
//  Copyright © 2017. Nagy, Valter. All rights reserved.
//

import UIKit

class ShowEmploeeListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func menuButton(_ sender: Any)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuPopUp") as! MenuPopUpViewController
        self.addChildViewController(popOverVC)
        //        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

    

}
