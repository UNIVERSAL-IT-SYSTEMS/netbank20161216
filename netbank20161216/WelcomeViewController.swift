//
//  WelcomeViewController.swift
//  netbank20161216
//
//  Created by Nagy, Valter on 2016. 12. 20..
//  Copyright © 2016. Nagy, Valter. All rights reserved.
//

import UIKit
import CoreData





class WelcomeViewController: UIViewController
{
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet var menuLeadConstrain: NSLayoutConstraint!
//    @IBOutlet var menuShadowLeadConstrain: NSLayoutConstraint!
    @IBOutlet var menuShadowLeadConstrain: NSLayoutConstraint!
    
    @IBOutlet var shadowBox: UIView!
    
    var menuOpened = 0
    
    @IBOutlet weak var gestureOutlet: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "hatter.jpg")!)
       
        //writing {username} label
        UsernameLabel.text = Util.scanUsername()
        menuLeadConstrain.constant = -250
        menuShadowLeadConstrain.constant = 375
        

        let tapSelector : Selector = #selector(menuGestureFunc)
        let tapGesture = UITapGestureRecognizer (target: self, action: tapSelector)
        tapGesture.numberOfTapsRequired = 1
        shadowBox.addGestureRecognizer(tapGesture)

        /*
        //gesture when menu opened
        gestureOutlet.isUserInteractionEnabled = true
        let tapSelector : Selector = #selector(WelcomeViewController.menuGesture)
        let menuGesture = UITapGestureRecognizer (target: self, action: tapSelector)
        if (menuOpened == 0)
        {
            menuGesture.numberOfTapsRequired = 1
        }
        else
        {
            menuGesture.numberOfTapsRequired = 3
        }
        gestureOutlet.addGestureRecognizer(menuGesture)
        */
        
    }
    
    func menuGestureFunc()
    {
        menuLeadConstrain.constant = -250
        UIView.animate(withDuration: 0.5)
        {
            self.view.layoutIfNeeded()
        }
        menuShadowLeadConstrain.constant = 375
        self.menuOpened = 0
    }
    

    @IBAction func menuButton(_ sender: Any)
    {
        if (self.menuOpened == 0)
        {
            menuLeadConstrain.constant = 0
            UIView.animate(withDuration: 0.5)
            {
                self.view.layoutIfNeeded()
            }

            menuShadowLeadConstrain.constant = 0
            self.menuOpened = 1
            
            //add gesture recognizer for the unused screen part
            
            
        }
        else
        {
            menuLeadConstrain.constant = -250
            UIView.animate(withDuration: 0.5)
            {
                self.view.layoutIfNeeded()
            }
            menuShadowLeadConstrain.constant = 375
            self.menuOpened = 0
        }
        
    }
    
    
    
    
/*
    @IBAction func menuButton(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuPopUp") as! MenuPopUpViewController
        self.addChildViewController(popOverVC)
        //        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        //popOverVC.didMove(toParentViewController: self)    
        
//        present(popOverVC, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(popOverVC, animated: true)
        
        let transition = CATransition()
        transition.duration = 2.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        //present(popOverVC, animated: false, completion: nil)
        self.navigationController?.pushViewController(popOverVC, animated: true)
        print("presented")
    }
 */
    
}





    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

