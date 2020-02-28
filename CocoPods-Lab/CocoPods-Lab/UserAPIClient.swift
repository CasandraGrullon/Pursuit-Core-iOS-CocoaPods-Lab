//
//  UserAPIClient.swift
//  CocoPods-Lab
//
//  Created by casandra grullon on 2/28/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import Foundation
import Alamofire

struct UserAPIClient {
    static func getUsers(completion: @escaping (AFResult<[User]>) -> ()) {
        let endpointURL = "https://randomuser.me/api/?results=50"
        
        guard let url = URL(string: endpointURL) else {
            return
        }
        
        AF.request(url).response { (response) in
            
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    completion(.success(results.results))
                } catch {
                    print("could not decode data")
                }
            }
            
            
        }
        
    }
}
