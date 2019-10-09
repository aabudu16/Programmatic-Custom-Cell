//
//  imageHelper.swift
//  Resturant-Tinder
//
//  Created by Tia Lendor on 9/17/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class ImageHelper {
    
    
    private init () {}
    
    static let shared = ImageHelper()
    
    func getImage(urlStr: String, completionHandler: @escaping (Result< UIImage, AppError>) -> Void){
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else{
                completionHandler(.failure(.noDataReceived))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(.notAnImage))
                return
            }
            completionHandler(.success(image))
            }.resume()
        
    }
}
