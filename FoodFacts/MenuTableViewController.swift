//
//  MenuTableViewController.swift
//  FoodFacts
//
//  Created by Archit Jain on 10/25/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit

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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
