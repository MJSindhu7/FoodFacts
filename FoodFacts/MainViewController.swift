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
import AlamofireImage

class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var menu: SideMenuNavigationController?
    var foodImage: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
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
    
    @IBAction func onScanButton(_ sender: UITapGestureRecognizer) {
        print("pressed scan button")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }
        else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 400, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        self.foodImage = scaledImage
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "foodIdentifier", sender: nil)
    }
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "foodIdentifier"){
            let destination = segue.destination as! NutrientViewController
            destination.foodImage = self.foodImage
            destination.requestType = "identify_fetch"
        }
    }
}
        
        
//         let myUrl = "https://api.nal.usda.gov/fdc/v1/foods/search?"
//        let item = self.food
//                print(item)
//        sendRequest(myUrl, parameters: ["query": item!, "api_key": "0W3hjLg8oNFCqQmj0H0uJcgc9yEgrZ8ZrTFVPc1E"]){ responseObject, error in
//                guard let responseObject = responseObject, error == nil else {
//                    print(error ?? "Unknown error")
//                    return
//            }
//
//                    //  print(responseObject)
//
//                   self.nutrients = responseObject["foods"] as! [NSDictionary]
//                    let nutrient = self.nutrients[0]
//                    // var foodNutrition = [NSDictionary]()
//                    self.foodNutrition = nutrient["foodNutrients"] as! [NSDictionary]
//            print("inside get")
//                    print(self.foodNutrition)
//
//
//            }
    
    
//
//    func sendRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
//     //print("INNNNNNN")
//    var components = URLComponents(string: url)!
//    components.queryItems = parameters.map { (key, value) in
//    URLQueryItem(name: key, value: value)
//    }
//    components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
//    let request = URLRequest(url: components.url!)
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data = data,
//            let response = response as? HTTPURLResponse,
//            (200 ..< 300) ~= response.statusCode,
//            error == nil else {
//                completion(nil, error)
//                return
//        }
//        let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
//        completion(responseObject, nil)
//    }
//    task.resume()
//
//    }
    

