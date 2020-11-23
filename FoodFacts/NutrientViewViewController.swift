//
//  NutrientViewViewController.swift
//  FoodFacts
//
//  Created by Sathya Sri Pasham on 11/15/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit
import Parse

class NutrientViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as! IngredientTableViewCell
       // let name = nutrients.ke ys[indexPath]
        //let ingridient = nutrients[indexPath.row]["user"]
        cell.ingredientName.text = (nutrients[indexPath.row]["nutrientName"] as! String)
        let value = nutrients[indexPath.row]["value"] as! Float64
        let str1 = "\(value)"
        cell.ingredientValue.text = str1
        return cell
    }
    
// var nutrients = [String: Float64]()
    //var nutrients1 = [NSDictionary]()
    var nutrients = [NSDictionary]()
    var itemName = String()
    var image: UIImage!
    var itemObj: PFObject!
    
    @IBOutlet weak var foodName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print("in the details view controller")
        print(nutrients)
        print(itemName)
        
//        if (itemObj != nil) {
//            foodName.text = itemObj["name"] as! String
//            imageView.image = UIImage(itemObj["image"])
//        } else {
            foodName.text = itemName
            imageView.image = image
        //}
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
//    func getDetails(_ sender: Any) {
//        let searchItem = SearchViewController()
//        searchItem.itemFeild.text! = itemName
//        searchItem.getDetails(sender)
//    }
    
    @available(iOS 13.0, *)
    @IBAction func onFavoriteButton(_ sender: Any) {
        setFavorite(_isFavorited: true)

        let fav_item = PFObject(className:"Favorites")
        
        fav_item["name"] = foodName.text!
        fav_item["user"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData()!
        let file = PFFileObject(data: imageData)
        fav_item["image"] = file
        
        fav_item.saveInBackground { (success, error) in
            if (success) {
                print("saved")
            } else {
                print("error")
            }
        }
    }
    
    @available(iOS 13.0, *)
    func setFavorite(_isFavorited:Bool) {
        if (_isFavorited){
            favButton.setImage(UIImage(systemName:"heart.fill"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(systemName:"heart"), for: UIControl.State.normal)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
