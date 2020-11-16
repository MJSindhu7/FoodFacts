//
//  NutrientViewViewController.swift
//  FoodFacts
//
//  Created by Sathya Sri Pasham on 11/15/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit

class NutrientViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as! IngredientTableViewCell
       // let name = nutrients.ke ys[indexPath]
        //let ingridient = nutrients[indexPath.row]["user"]
        cell.ingredientName.text = nutrients[indexPath.row]["nutrientName"] as! String
        let value = nutrients[indexPath.row]["value"] as! Float64
        let str1 = "\(value)"
        cell.ingredientValue.text = str1
        return cell
    }
    
// var nutrients = [String: Float64]()
    var nutrients1 = [NSDictionary]()
    var nutrients = [NSDictionary]()
    @IBOutlet weak var foodName: UILabel!
   var itemName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print("in the details view controller")
        print(nutrients)
        print(itemName)
        foodName.text = itemName
        
      
     self.tableView.reloadData()
        // Do any additional setup after loading the view.
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
