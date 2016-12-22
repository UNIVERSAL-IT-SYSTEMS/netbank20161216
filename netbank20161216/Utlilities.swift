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
    
    
    
//ezt ki lehet egyaltlalan hozni ide?
//    class func ViewControll(viewControl: String) //-> UIViewController
//    {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier :"viewControl")
//        self.present(viewController, animated: true)
//        self.navigationController?.showViewController(viewController, sender: nil)
//    }
    
    
}
