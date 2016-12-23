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
        do
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let context = Util.getContext()
            let results = try context.fetch(request)
        
            for items in results as! [NSManagedObject]
            {
                let username = items.value (forKey: "username") as! String
                UsernameLabel.text = username
            }
        }
        catch
        {
            print("Error - WelcomeViewController - viewDidLoad")
        }
    }
    
    
    
    
    @IBAction func LogoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"LoginViewController")
        self.present(viewController, animated: true)
    }
}
