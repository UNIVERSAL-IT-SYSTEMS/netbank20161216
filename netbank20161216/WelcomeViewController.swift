//
//  WelcomeViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 20..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

class WelcomeViewController: UIViewController
{
    @IBOutlet weak var UsernameLabel: UILabel!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)

        //writing {username} label
        UsernameLabel.text = Util.scanUsername()
    }

    
    
    @IBAction func LogoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"LoginViewController")
        self.present(viewController, animated: true)
    }
}
