//
//  LoginViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 21..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData





func sha256(string: String) -> Data? {
    guard let messageData = string.data(using:String.Encoding.utf8) else { return nil }
    var digestData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
    
    _ = digestData.withUnsafeMutableBytes {digestBytes in
        messageData.withUnsafeBytes {messageBytes in
            CC_SHA256(messageBytes, CC_LONG(messageData.count), digestBytes)
        }
    }
    return digestData
}









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
                
                //print(PasswordTextField.text)
                let shaData = sha256(string:PasswordTextField.text!)
                let shaHex =  shaData!.map { String(format: "%02hhx", $0) }.joined()
                print("pass in sha256: \(shaHex)")
                
                if  (pass == shaHex) {
                    
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
