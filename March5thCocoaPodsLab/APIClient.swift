//
//  APIClient.swift
//  March5thCocoaPodsLab
//
//  Created by Margiett Gil on 3/6/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation
import Alamofire // import NetworkHelper


struct APIClient {
    
    static func getUsers(completion: @escaping (AFResult<[User]>) -> ()) {
        let endpointURLString = "https://randomuser.me/api/?results=50"
        
        // we need a URL
        guard let url = URL(string: endpointURLString) else {
            return
        }
        
        AF.request(url).response { (response) in
            // response.data
            // response.error
            // response.request
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                // stir our cocktail
                do{
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    let users = results.results
                        completion(.success(users))
                } catch {
                    print("oops")
                }
            }
        }
    }
}
