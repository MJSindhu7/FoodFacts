//
//  SearchViewController.swift
//  FoodFacts
//
//  Created by SindhuRam on 11/3/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

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
        sendRequest(myUrl, parameters: ["query": item, "api_key": ""]){ responseObject, error in
        guard let responseObject = responseObject, error == nil else {
            print(error ?? "Unknown error")
            return
            
    }
        print(responseObject)
    }
    }
    
   
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //print("Hey on cancel!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
