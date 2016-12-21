//
//  LoginViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 21..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var PasswordTextField: UITextField!
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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        
        if (PasswordTextField.text == ""){
            let alert = UIAlertController(title: "Error", message: "No password was given!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let context = getContext()
            let results = try context.fetch(request)
            
            for items in results as! [NSManagedObject]{
                let pass = items.value (forKey: "password") as! String
                if  pass == PasswordTextField.text {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"WelcomeViewController")
                    self.present(viewController, animated: true)
                    }
                else {
                    let alert = UIAlertController(title: "Error", message: "The password you gave was incorrect!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)

                }
                
                
            }
        }catch{
            print("Error...")
        }
        
    }

    
    
    @IBAction func DeleteDataButton(_ sender: Any) {
        //alert
        let alert = UIAlertController(title: "Warning", message: "All user data will be deleted. Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))

        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            //deleting data
            do{
                let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
                let request = NSBatchDeleteRequest(fetchRequest: fetch)
                _ = try self.getContext().execute(request)
                
                //jump to the RegisterViewController
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier :"FirstOpenViewController")
                self.present(viewController, animated: true)
                
            }catch{}
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        

        
    }

}
