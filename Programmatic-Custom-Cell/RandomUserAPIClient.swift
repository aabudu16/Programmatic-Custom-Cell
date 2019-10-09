//
//  RandomUserAPIClient.swift
//  Programmatic-Custom-Cell
//
//  Created by Mr Wonderful on 10/8/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

class RandomUserAPIClient{
    static let shared = RandomUserAPIClient()
    
    
    func getData(complitionHandler: @escaping (Result<[User],AppError>)-> Void){
        
        let userURL = "https://randomuser.me/api/?results=50"
        
        guard let url = URL(string: userURL) else {complitionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result{
            case .failure(let error):
                complitionHandler(.failure(error))
            case .success(let data):
                
                do{
                    let randomUser = try JSONDecoder().decode(RandomUserWrapper.self, from: data)
                    complitionHandler(.success(randomUser.results))
                }catch{
                    complitionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
