//
//  Utlilities.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 22..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

class Util : UIViewController
{
    class func getContext () -> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    class func sha256(string: String) -> Data?
    {
        guard let messageData = string.data(using:String.Encoding.utf8)
            else { return nil }
        var digestData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_SHA256(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData
    }
    


// writing {username} label

    class func scanUsername () -> String
    {
    var usrName = String()
        do
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let context = Util.getContext()
            let results = try context.fetch(request)

 
            for items in results as! [NSManagedObject]
                {
                    usrName = (items.value (forKey: "username") as! String)
                }
        }
        catch
        {
            print("Error - LoginViewController - viewDidLoad")
        }
        return usrName
    }
    
    
    
    class func openViewController(DisplayVC :String)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: DisplayVC) as UIViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = view
        //self.present(viewController, animated: true)
    }
 
    
    
    
    
    
/*
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
*/
    
    
/*
    class func menuButton() -> UIViewController
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuPopUp") as! MenuPopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
        print("menuButton")
        return popOverVC
    }
     
     
     
     func displayContentController(content: UIViewController)
     {
        addChildViewController(content)
        self.view.addSubview(content.view)
        content.didMove(toParentViewController: self)
        print("displayConttentController")
     }
 */
    

    
    
 
}

