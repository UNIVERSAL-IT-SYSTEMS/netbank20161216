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
                    print(name!, ", ")
                    names.append(name as! String)
                    
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
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        print("Selected row:", indexPath.row)
        //var ID : Int
        ID = indexPath.row

        Util.openViewController(DisplayVC: "ShowEmployee")    
        }
    
}
