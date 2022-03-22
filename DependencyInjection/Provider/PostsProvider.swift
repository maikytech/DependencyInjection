//
//  PostsProvider.swift
//  DependencyInjection
//
//  Created by Maiqui Cedeño on 17/03/22.
//

import Foundation

final class PostsProvider: PostProviderProtocol {
  
    func getPost(_ completion: @escaping (Result<([PostModel], URLResponse?), Error>) -> Void) {
        
        let url = EndPoint.domain
        guard let objectURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: objectURL) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }else if let data = data, let response = response {
                do{
                    let res = try JSONDecoder().decode([PostModel].self, from: data)
                    //sleep 1
                    completion(.success((res, response)))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

