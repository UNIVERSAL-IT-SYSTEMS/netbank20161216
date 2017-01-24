//
//  ViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 16..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

class FirstOpenViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        do
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let context = Util.getContext()
            let results = try context.fetch(request)
            
                if results.count != 0
                {
                    for items in results as! [NSManagedObject]
                    {
                        let uname = items.value (forKey: "username")
                        let fname = items.value (forKey: "fullname")
                        let email = items.value (forKey: "email")
                        let pass = items.value (forKey: "password")
                        
                        print(uname!, fname!, email!, pass!)
                    }
                    print("Skipping to login")
                    
                    //opening LoginViewController
                    Util.openViewController(DisplayVC: "LoginViewController")

                }
        }
        catch
        {
            print("Error - FirstOpenViewController viewDidAppear")
        }
    }
}
