//
//  RegisterViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 19..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData


class RegisterViewController: UIViewController
{
    //Textfields
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var FullnameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var Password1TextField: UITextField!
    @IBOutlet weak var Password2TextField: UITextField!

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)
    }
    
    
    
    @IBAction func RegisterButton(_ sender: UIButton)
    {
        //checking empty fields
        if (UsernameTextField.text == "" || FullnameTextField.text == "" || EmailTextField.text == "" || Password1TextField.text == "" || Password2TextField.text == "")
        {
            let alert = UIAlertController(title: "Error", message: "All fields must be fiiled!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        //checking if password identical
        if (Password1TextField.text != Password2TextField.text)
        {
            let alert = UIAlertController(title: "Error", message: "The passwords must be identical!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            Password1TextField.text = "";
            Password2TextField.text = "";
            return
        }
        
        //checking e-mail adress
        func isValidEmail(Email:String) -> Bool
        {
            // print("validate calendar: \(testStr)")
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: Email)
        }

        if (!isValidEmail(Email: EmailTextField.text!))
        {
            let alert = UIAlertController(title: "Error", message: "The given email is not valid!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        
        //making password encrypted
        let shaData = Util.sha256(string:Password1TextField.text!)
        let password = shaData!.map { String(format: "%02hhx", $0) }.joined()
        
        
        //saving data (CoreData)
        let context = Util.getContext()
        let entity =  NSEntityDescription.entity(forEntityName: "Users", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
            //set the entity values
        transc.setValue(UsernameTextField.text, forKey: "username")
        transc.setValue(password, forKey: "password")
        transc.setValue(EmailTextField.text, forKey: "email")
        transc.setValue(FullnameTextField.text, forKey: "fullname")
        
            //actually saving the object
        do
        {
            try context.save()
            print("Saved into CoreData!")
        }
        catch
            let error as NSError
                {
                print("Could not save \(error), \(error.userInfo)")
                }
        
        /*
        //print all saved data to console
        //kell ez ide egyáltalán??
        do
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let results = try context.fetch(request)

            if results.count > 0 {
                for items in results as! [NSManagedObject]{
                    let uname = items.value (forKey: "username")
                    let fname = items.value (forKey: "fullname")
                    let email = items.value (forKey: "email")
                    let pass = items.value (forKey: "password")

                   print(uname!, fname!, email!, pass!)
               }
            }
        }
        catch
        {
            print("Error - RegisterViewController - RegisterButton")
        }
         */
        
        //if all done, opening WelcomeViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"WelcomeViewController")
        self.present(viewController, animated: true)
    }
}


        
        
        
        
        
        



