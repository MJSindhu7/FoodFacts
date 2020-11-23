//
//  SearchViewController.swift
//  FoodFacts
//
//  Created by SindhuRam on 11/3/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
var nutrients = [NSDictionary]()
    var fnutries = [String : Float64]()
    var foodNutrition = [NSDictionary]()
    func sendRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
        //print("INNNNNNN")
       var components = URLComponents(string: url)!
       components.queryItems = parameters.map { (key, value) in
       URLQueryItem(name: key, value: value)
       }
       components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
       let request = URLRequest(url: components.url!)
       let task = URLSession.shared.dataTask(with: request) { data, response, error in
           guard let data = data,
               let response = response as? HTTPURLResponse,
               (200 ..< 300) ~= response.statusCode,
               error == nil else {
                   completion(nil, error)
                   return
           }
           let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
           completion(responseObject, nil)
       }
       task.resume()
        
       }
    
    
    @IBOutlet weak var itemFeild: UITextField!

    @IBAction func getDetails(_ sender: Any) {
        
        let myUrl = "https://api.nal.usda.gov/fdc/v1/foods/search?"
         let item = String(itemFeild.text!)
        print(item)
        let api = "CFr1PwAuR2HAg9DTdImTKG3hL0pdHZglDotDrBq3"
        sendRequest(myUrl, parameters: ["query": item, "api_key": api]){ responseObject, error in
        guard let responseObject = responseObject, error == nil else {
            print(error ?? "Unknown error")
            return
    }
            
//                print(responseObject)
           
           self.nutrients = responseObject["foods"] as! [NSDictionary]
            let nutrient = self.nutrients[0]
            // var foodNutrition = [NSDictionary]()
            self.foodNutrition = nutrient["foodNutrients"] as! [NSDictionary]
            print(self.foodNutrition)
         
        
    }
        
    }
    
    @IBAction func showDetails(_ sender: Any) {
        print("in show details")
        print(foodNutrition)
        self.performSegue(withIdentifier: "NutritionSegue", sender: self)
    }
    
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //print("Hey on cancel!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "NutritionSegue"){
            let destVC = segue.destination as! NutrientViewViewController
           destVC.nutrients = foodNutrition
            destVC.itemName = itemFeild.text!
        }
    }
   

}
