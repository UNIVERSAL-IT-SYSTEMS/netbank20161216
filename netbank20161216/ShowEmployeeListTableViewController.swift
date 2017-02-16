//
//  ShowEmployeeListTableViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2017. 01. 20..
//  Copyright © 2017. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData

var ID: Int = 0


class ShowEmployeeListTableViewController: UITableViewController
{
//    public var ID: Int = 0

    
    
    var names = [String]()
    var imageData : NSData? = nil
    var imageDatas = [UIImage]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                    imageData = items.value(forKeyPath: "profilepicture") as? NSData
                    print(name!, ", ")
                    names.append(name as! String)
                    
                    
                    if (imageData == nil)
                    {
                        imageData = (UIImageJPEGRepresentation(UIImage (named: "blank-profile-picture.png")!, 1.0) as NSData?)!
                    }
                    let imagePt = UIImage(data: (imageData) as! Data)
                    imageDatas.append(imagePt!)
                    imageData = nil
                }
        
            }
        }
        catch
        {
            print("Error - RegisterViewController - RegisterButton")
        }
        
        
        //    return names.count
        
    }

    
    
        
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return names.count
    }
    
    

    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        
        //cell.textLabel?.frame = CGRect(x: CGFloat(80), y: CGFloat(0), width: CGFloat(250), height: CGFloat(43.5))
        //cell.textLabel?.drawText(in: CGRect(x: CGFloat(80), y: CGFloat(0), width: CGFloat(250), height: CGFloat(43.5)))
        //cell.textLabel?.preferredMaxLayoutWidth = CGFloat(200)
        //cell.textLabel?.frame(forAlignmentRect: CGRect(x: CGFloat(80), y: CGFloat(0), width: CGFloat(250), height: CGFloat(43.5)))
        //cell.textLabel?.
        cell.textLabel?.text = names[indexPath.row]
        
        //cell.imageView?.frame(forAlignmentRect: CGRect(x: CGFloat(15), y: CGFloat(0), width: CGFloat(43.5), height: CGFloat(43.5)))
        //cell.imageView?.image = imageDatas[indexPath.row]
        

        
        /*
        let imgView = UIImageView(frame: CGRect(x: CGFloat(15), y: CGFloat(0), width: CGFloat(43.5), height: CGFloat(43.5)))
        imgView.backgroundColor = UIColor.clear
        imgView.layer.cornerRadius = 8.0
        imgView.layer.masksToBounds = true
        imgView.image = imageDatas[indexPath.row]
        cell.contentView.addSubview(imgView)
        */
        

        /*
        var itemSize = CGSize(width: CGFloat(40), height: CGFloat(40))
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale)
        var imageRect = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat(itemSize.width), height: CGFloat(itemSize.height))
        cell.imageView?.image?.draw(in: imageRect)
        cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        */
        
       // let itemSize = CGSize(width: CGFloat(25), height: CGFloat(25))

      //  UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale)
        
        //let imageRect = CGRect(x: CGFloat(15), y: CGFloat(0), width: CGFloat(43.5), height: CGFloat(43.5))
        //cell.imageView?.image!.draw(in: imageRect)
        
        cell.imageView?.image = imageDatas[indexPath.row]


        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("Selected row:", indexPath.row)
        //var ID : Int
        ID = indexPath.row

        //Util.openViewController(DisplayVC: "ShowEmployee")
    
    let presentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "showEmployeeNavigation")

    present (presentVC, animated: true, completion: nil)

    
        }

}
