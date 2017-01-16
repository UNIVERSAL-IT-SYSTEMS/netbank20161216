//
//  LoginViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 21..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData


class LoginViewController: UIViewController
{
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var UsernameLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)
        
        // writing {username} label
        UsernameLabel.text = Util.scanUsername()
    }

    
    @IBAction func LoginButton(_ sender: Any)
    {
        
        if (PasswordTextField.text == "")
        {
            let alert = UIAlertController(title: "Error", message: "No password was given!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        do
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let context = Util.getContext()
            let results = try context.fetch(request)
            
            for items in results as! [NSManagedObject]
            {
                let pass = items.value (forKey: "password") as! String
                let shaData = Util.sha256(string:PasswordTextField.text!)
                let shaHex =  shaData!.map { String(format: "%02hhx", $0) }.joined()
                print("pass in sha256: \(shaHex)")
                
                if  (pass == shaHex)
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"WelcomeViewController")
                    self.present(viewController, animated: true)
                }
                else
                {
                    let alert = UIAlertController(title: "Error", message: "The password you gave was incorrect!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        catch
        {
            print("Error - LoginViewController - LoginButton")
        }
        
    }

    
    @IBAction func DeleteDataButton(_ sender: Any) {
        //alerting user that all data gets deleted
        let alert = UIAlertController(title: "Warning", message: "All user data will be deleted. Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            //deleting data and jump to RegisterViewController
            do
            {
                let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
                let request = NSBatchDeleteRequest(fetchRequest: fetch)
                _ = try Util.getContext().execute(request)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier :"FirstOpenViewController")
                self.present(viewController, animated: true)
            }
            catch
            {
                print("Error - LoginViewController - DeleteDataButton")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
