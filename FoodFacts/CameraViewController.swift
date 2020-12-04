////
////  CameraViewController.swift
////  FoodFacts
////
////  Created by SindhuRam on 11/3/20.
////  Copyright © 2020 archit. All rights reserved.
////
//
//import UIKit
//import AlamofireImage
//
//class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var foodLabel: UILabel!
//
//    var nutrients = [NSDictionary]()
//    var foodNutrition = [NSDictionary]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func onGetDetails(_ sender: Any) {
//        print("in Get Nutrition Details")
//        print(foodNutrition)
//    self.performSegue(withIdentifier: "NutritionSegue2", sender: self)
//    }
//
//
//    @IBAction func onCameraButton(_ sender: Any) {
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        picker.allowsEditing = true
//
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            picker.sourceType = .camera
//        }
//        else {
//            picker.sourceType = .photoLibrary
//        }
//        present(picker, animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = info[.editedImage] as! UIImage
//
//        let size = CGSize(width: 300, height: 300)
//        let scaledImage = image.af_imageScaled(to: size)
//        imageView.image = scaledImage
//        dismiss(animated: true, completion: nil)
//        getFoodFromImage(image: image) { (food) in
//            print(food)
//            self.foodLabel.text = food
//        }
//         let myUrl = "https://api.nal.usda.gov/fdc/v1/foods/search?"
//        let item = self.foodLabel.text
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
//    }
//
//
//
//}
