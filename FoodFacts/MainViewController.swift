//
//  MainViewController.swift
//  FoodFacts
//
//  Created by Archit Jain on 10/24/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit
import Parse
import SideMenu

class MainViewController: UIViewController {
    
    var menu: SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        menu = SideMenuNavigationController(rootViewController: MenuTableViewController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    @IBAction func onTapMenu(){
        present(menu!, animated: true)
        
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        dismiss(animated: true, completion: nil)
    }
}
