//
//  WelcomeViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 20..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData
import SideMenu




class WelcomeViewController: UIViewController
{
    @IBOutlet weak var UsernameLabel: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)
       
        self.printline()
                //writing {username} label
        UsernameLabel.text = Util.scanUsername()
        
        
    }
    
    func printline()
    {
        print ("print on open")
    }

    


    @IBAction func menuButton(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuPopUp") as! MenuPopUpViewController
        self.addChildViewController(popOverVC)
        //        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
}





    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

