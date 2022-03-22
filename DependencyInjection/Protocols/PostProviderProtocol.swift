//
//  PostProviderProtocol.swift
//  DependencyInjection
//
//  Created by Maiqui Cedeño on 20/03/22.
//



import Foundation

protocol PostProviderProtocol {
    func getPost(_ completion: @escaping (Result<([PostModel], URLResponse?), Error>) -> Void)
    //getPosts(_ completion: @escaping (Result<([PostModel], URLResponse?), Error>) -> Void)
}
