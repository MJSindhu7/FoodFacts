//
//  CameraViewController.swift
//  FoodFacts
//
//  Created by SindhuRam on 11/3/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit
import AlamofireImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onGetDetails(_ sender: Any) {
        print("Get Nutrition Details")
//        sendRequest(myUrl, parameters: ["query": item, "api_key": "yi6bnd5eaUd3rE9P5SvOPOKzYbfedJz4ZEzLRc60"]){ responseObject, error in
//               guard let responseObject = responseObject, error == nil else {
//                   print(error ?? "Unknown error")
//                   return
//           }
//        }
//        getFoodFromImage(image: imageView.image!){_ in
//            responseObject
//
//            print(responseObject)
//        }
    }
    @IBAction func onCameraButton(_ sender: Any) {
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
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
        getFoodFromImage(image: image) { (food) in
            print(food)
            self.foodLabel.text = food
        }
    }
    
    func getFoodFromImage(image: UIImage, completion: @escaping (String) -> Void){
        
        let group = DispatchGroup()
            
        var food = "Recognition Failed"
        let boundary = UUID().uuidString
        let api_token = "3712982aeace39bc1f0792cabfb2caab27c7da5c"
        let url = URL(string: "https://api.logmeal.es/v2/recognition/dish")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(api_token)", forHTTPHeaderField: "Authorization")
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpeg\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.jpegData(compressionQuality: 1)!)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        group.enter()
        URLSession.shared.uploadTask(with: request, from: data){data,
            response, error in
            if let data = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]{
                if let recognitionOptions = try? data["recognition_results"] as! [[String: Any]] {
                    if recognitionOptions.count == 0{
                        DispatchQueue.main.async {completion("Unknown" as! String)}
                    }
                    if recognitionOptions.count > 0{
                        DispatchQueue.main.async {completion(recognitionOptions[0]["name"] as! String)}
                    }
                   
                }
                
            }
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            group.leave()
        }.resume()
    }
}
