//
//  ShowEmployeeViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2017. 01. 20..
//  Copyright © 2017. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData


class ShowEmployeeViewController: UIViewController {
    
    
    //textfield outlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    
    @IBOutlet weak var profilepicOutlet: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)

//        print("get ID inside class in newVC:", ShowEmployeeListTableViewController().ID)
        print("global ID newVC:", ID)
        
        let context = Util.getContext()
        do
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
            let results = try context.fetch(request)
            var temp = 0
            var name = "" as String
            var address = "" as String
            var department = "" as String
            var imageData : NSData? = nil
            
            if (imageData == nil)
            {
                print("imageData after inicialization is 'nil'")
            }
            
            for items in results as! [NSManagedObject]
            {
//                if (temp == ShowEmployeeListTableViewController().ID)
                if (temp == ID)
                {
                    name = items.value (forKey: "name") as! String
                    address = items.value (forKey: "address") as! String
                    department = items.value (forKey: "department") as! String
                    
                    imageData = items.value(forKeyPath: "profilepicture") as? NSData
                    
//                    print("Name: ", name, "Address: ", address, "Department: ", department, "Profilepic: ", profilepic)
                }
                temp = temp + 1
            }
            
            if (imageData == nil)
            {
                print("imageData after for cyle is 'nil'")
            }

            nameLabel.text = name
            addressLabel.text =  address
            departmentLabel.text = department
            if (imageData == nil)
            {
                imageData = (UIImageJPEGRepresentation(UIImage (named: "blank-profile-picture.png")!, 1.0) as NSData?)!
            }
            let imagePt = UIImage(data: (imageData ) as! Data)
            profilepicOutlet.image = imagePt

        }
        catch
        {
            print("Error - RegisterViewController - RegisterButton")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func menuButton(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuPopUp") as! MenuPopUpViewController
        self.addChildViewController(popOverVC)
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

    

}
