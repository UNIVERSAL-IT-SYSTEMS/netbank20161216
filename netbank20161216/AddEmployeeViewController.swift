//
//  AddEmployeeViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2017. 01. 20..
//  Copyright © 2017. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

class AddEmployeeViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    
    //textfields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var profilepicTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)
        
        imageOutlet.image = UIImage (named: "blank-profile-picture.png")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func menuButton(_ sender: Any)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuPopUp") as! MenuPopUpViewController
        self.addChildViewController(popOverVC)
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

    
    
    
    
    // MARK: IMAGE
    
    @IBOutlet weak var imageOutlet: UIImageView!
    var imageData : NSData? = nil
    
    
    @IBAction func addImageButton(_ sender: Any) {
            let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
     //   pickerController.allowsEditing = true
        self.present(pickerController, animated: true, completion: nil)
    }
    
/*
    // camera is not available in simulator
    @IBAction func shotImageButton(_ sender: Any) {
            let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.camera
        present(pickerController, animated: true, completion: nil)
    }
*/
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageOutlet.image = pickedImage
            imageData = (UIImageJPEGRepresentation(pickedImage, 1.0) as NSData?)!
            
           // let imageData: NSData = UIImagePNGRepresentation(imData)
            //imageData = UIImagePNGRepresentation(pickedImage)


            print("image picked")
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // MARK: SAVE DATA
    
    @IBAction func saveNewEmployeeData(_ sender: Any)
    {
        
        //saving data (CoreData)
        let context = Util.getContext()
        let entity =  NSEntityDescription.entity(forEntityName: "Employee", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
    
        //set the entity values
        transc.setValue(nameTextField.text, forKey: "name")
        transc.setValue(addressTextField.text, forKey: "address")
        transc.setValue(departmentTextField.text, forKey: "department")
        transc.setValue("", forKey: "profilepic")
        transc.setValue(imageData, forKey: "profilepicture")
    
        if (imageData == nil)
        {
            print("imageData when saving coredata is 'nil'")
        }
        
        //actually saving the object
        do
        {
            try context.save()
            print("Employee saved into CoreData!")
        }
        catch
        let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
    
    /*
        //print all saved data to console
        do
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
            let results = try context.fetch(request)
     
            if results.count > 0
            {
                for items in results as! [NSManagedObject]
                {
                    let name = items.value (forKey: "name")
                    let address = items.value (forKey: "address")
                    let department = items.value (forKey: "department")
                    let profilepic = items.value (forKey: "profilepic")
     
                    print(name!, address!, department!, profilepic!)
                }
            }
        }
        catch
        {
            print("Error - RegisterViewController - RegisterButton")
        }
    */
    }

    
    
    @IBAction func printSavedDataToConsole(_ sender: Any) {
        let context = Util.getContext()
        do
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for items in results as! [NSManagedObject]
                {
                    let name = items.value (forKey: "name")
                    let address = items.value (forKey: "address")
                    let department = items.value (forKey: "department")
                    let profilepic = items.value (forKey: "profilepic")
                    
                    print("Name: ", name!, "Address: ", address!, "Department: ", department!, "Profilepic: ", profilepic!)
                }
            }
        }
        catch
        {
            print("Error - RegisterViewController - RegisterButton")
        }

        
    }
    
    
    @IBAction func delContent(_ sender: Any) {
        let context = Util.getContext()
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do
        {
            try context.execute(request)
            print("CoreData: data deleted")
        }
        catch
            let error as NSError
        {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    
    
    
    
    
}
