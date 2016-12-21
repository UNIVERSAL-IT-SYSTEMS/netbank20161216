//
//  ViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 16..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}


//func myfunc() {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    //let viewController = storyboard.instantiateViewController(withIdentifier :"WelcomeViewController") as! UIViewController
//    let viewController = WelcomeViewController()
//    self.present(viewController, animated: true)
//}


class FirstOpenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)
        
        //Check application status (activated?)
        
       /* do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let context = getContext()
            let results = try context.fetch(request)
            
            if results.count != 0 {
                for items in results as! [NSManagedObject]{
                    let uname = items.value (forKey: "username")
                    let fname = items.value (forKey: "fullname")
                    let email = items.value (forKey: "email")
                    let pass = items.value (forKey: "password")
                    
                    print(uname!, fname!, email!, pass!)}
                print("Skipping to login")
                //opening WelcomeViewController

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as UIViewController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                //show window
                appDelegate.window?.rootViewController = view
                
            }
        }catch{
            print("Error...")
        }*/
    
    }

    override func viewDidAppear(_ animated: Bool){
        do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let context = getContext()
            let results = try context.fetch(request)
                if results.count != 0 {
                    //opening WelcomeViewController
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as UIViewController
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    //show window
                    appDelegate.window?.rootViewController = view
            }
        }catch{
            print("Error...")
        }
    }





    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func HaveAccount(_ sender: Any) {

        print("Gombnyomás")
       // myfunc()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"WelcomeViewController") 
        self.present(viewController, animated: true)
        

    

    }

    
    
}

