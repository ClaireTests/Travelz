//
//  Webservice.swift
//  Travelz
//
//  Created by claire.roughan on 26/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

import Foundation

class Webservice {
    
    static func getDataWith(completion: @escaping (Result<ArticleList, Error>) -> ()) {

        guard let url = URL(string:BASE_URL ) else { return }
           
          URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let articlesInfo = try JSONDecoder().decode(ArticleList.self, from: data!)
                completion(.success(articlesInfo))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}
