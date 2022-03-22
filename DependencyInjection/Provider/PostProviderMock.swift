//
//  PostProviderMock.swift
//  DependencyInjection
//
//  Created by Maiqui Cedeño on 20/03/22.
//

import Foundation

class PostsProviderMock : PostProviderProtocol{
    func getPost(_ completion: @escaping (Result<([PostModel], URLResponse?), Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "PostsMock", withExtension: "json") else {
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try Data(contentsOf: url)
            let model = try decoder.decode([PostModel].self, from: jsonData)
            completion(.success((model, nil)))
        }catch let error{
            completion(.failure(error))
        }
        
    }
}
