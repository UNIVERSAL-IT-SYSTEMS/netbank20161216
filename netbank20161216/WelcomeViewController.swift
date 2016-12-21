//
//  WelcomeViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 20..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var UsernameLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)

        //{username}
        do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let context = getContext()
            let results = try context.fetch(request)
            
            for items in results as! [NSManagedObject]{
                let username = items.value (forKey: "username") as! String
                UsernameLabel.text = username
            }
            
            
            
        }catch{
            print("Error...")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RestartButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"FirstOpenViewController")
        self.present(viewController, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
