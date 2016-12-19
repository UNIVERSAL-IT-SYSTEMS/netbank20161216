//
//  RegisterViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 19..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    //Textfields
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var FullnameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var Password1TextField: UITextField!
    @IBOutlet weak var Password2TextField: UITextField!
    
    
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func RegisterButton(_ sender: UIButton) {
        
        
        //checking data
        if (UsernameTextField.text == "" || FullnameTextField.text == "" || EmailTextField.text == "" || Password1TextField.text == "" || Password2TextField.text == ""){
            print ("Minden adatot ki kell tölteni!")
            let alert = UIAlertController(title: "Hiba", message: "Minden adatot ki kell tölteni!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if (Password1TextField.text != Password2TextField.text){
            let alert = UIAlertController(title: "Hiba", message: "A két jelszónak meg kell egyeznie!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            Password1TextField.text = "";
            Password2TextField.text = "";
            return
        }
        
        
        //saving data (CoreData)
        
        let context = getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        transc.setValue(UsernameTextField.text, forKey: "username")
        transc.setValue(Password1TextField.text, forKey: "password")
        transc.setValue(EmailTextField.text, forKey: "email")
        transc.setValue(FullnameTextField.text, forKey: "fullname")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    
    }
}

    
        
        
        
        
        
        



