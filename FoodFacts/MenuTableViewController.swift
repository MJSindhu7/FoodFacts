//
//  MenuTableViewController.swift
//  FoodFacts
//
//  Created by Archit Jain on 10/25/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit
import Parse

class MenuTableViewController: UITableViewController {

    var items = ["Home", "Favorites", "Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .systemOrange
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "menuCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .systemOrange
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("Home")
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//            let mainView = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//            self.navigationController?.pushViewController(mainView, animated: true)
        }
        
        if indexPath.row == 1 {
            print("Favorites")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let favoritesViewController = storyBoard.instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
            self.present(favoritesViewController, animated: true, completion: nil)
        }
        
        if indexPath.row == 2 {
            print("Logout")
            PFUser.logOut()
            view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
