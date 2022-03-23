//
//  PostsViewModel.swift
//  DependencyInjection
//
//  Created by Maiqui Cedeño on 17/03/22.
//

import Foundation

final class PostsViewModel {
    private var provider: PostProviderProtocol
    
    //provider: PostProviderProtocol = PostsProvider() means Default Value
    init(provider: PostProviderProtocol = PostsProvider()) {
        self.provider = provider
        //self.provider = PostsProviderMock()
    }
    
    func getUserFromProvider(_ completion: @escaping ([PostModel]) -> Void ) {
        provider.getPost({ response in
            switch response {
            case .success((let model, _)):
                completion(model)
            case .failure(let error):
                print("error: ", error.localizedDescription)
            }
        })
    }
}
