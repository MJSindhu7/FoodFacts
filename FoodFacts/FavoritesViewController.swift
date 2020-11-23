//
//  FavoritesViewController.swift
//  FoodFacts
//
//  Created by Haasi  on 11/12/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit
import Parse

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var fav_items = [PFObject]()
    var selectedPost: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fav_items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell") as! FavoritesCell
        //cell.delegate = self as! favoriteCellDelegate
        //cell.indexPath = indexPath
        
        let post = fav_items[indexPath.row]
        cell.foodLabel.text = (post["name"] as! String)
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af.setImage(withURL: url)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Favorites")
        query.includeKey("user")
        query.limit = 20
        
        query.findObjectsInBackground { (fav_items, error) in
            if (fav_items != nil) {
                self.fav_items = fav_items!
                self.tableView.reloadData()
            }
        }
    }
    
//    func tableView(tableView: UITableView, didSelectRowAt indexPath: NSIndexPath) {
//        print("Inside did selete row at index path")
////        let post = fav_items[indexPath.section]
////
////        print("Post namr: \(post["name"])")
////        print("selected cell \(indexPath.row)")
//    }
    
    @IBAction func onDeleteButton(_ sender: UIButton) {
        let buttonPostion = sender.convert(sender.bounds.origin, to: tableView)

        if let indexPath = tableView.indexPathForRow(at: buttonPostion) {
            let post = fav_items[indexPath.row]
            let query = PFQuery(className:"Favorites")
            query.whereKey("name", equalTo: (post["name"] as! String))
            query.getFirstObjectInBackground(block: {(parseObject: PFObject?, error: Error?) -> Void in
                print("inside get object")
                if error != nil {
                    print(error)
                } else if parseObject != nil {
                    parseObject?.deleteInBackground()
                    print("item deleted")
                }
            })
            tableView.reloadData()
        }
    }

//    func getDetails(sender: Any?) {
//        let myUrl = "https://api.nal.usda.gov/fdc/v1/foods/search?"
//        let api = "CFr1PwAuR2HAg9DTdImTKG3hL0pdHZglDotDrBq3"
//        let search = SearchViewController()
//
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//        let post = fav_items[indexPath.row]
//        let item = (post["name"] as! String)
//
//        search.sendRequest(myUrl, parameters: ["query": item, "api_key": api]){ responseObject, error in
//        guard let responseObject = responseObject, error == nil else {
//            print(error ?? "Unknown error")
//            return
//            }
//    }
//    }
/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//
//        let food = fav_items[indexPath.row]
//        let foodName = food["name"] as! String
//        print(foodName)
//        let destVC = segue.destination as! NutrientViewViewController
        //destVC.itemObj = food
//        destVC.itemName = food["name"] as! String
//        if(segue.identifier == "NutritionSegue2"){
//            let destVC = segue.destination as! NutrientViewViewController
//            destVC.nutrients = foodNutrition
//            destVC.itemName = foodLabel.text!
//            destVC.image = imageView.image!
//        }
    }
*/

}
