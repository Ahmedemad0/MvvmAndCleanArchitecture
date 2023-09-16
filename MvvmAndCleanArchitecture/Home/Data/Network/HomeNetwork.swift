//
//  HomeNetwork.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 15/09/2023.
//

import Foundation
import Combine

protocol HomeRemoteRepo {
    func getPosts()-> AnyPublisher<[PostsModel], Error >
}

class HomeNetwork: HomeRemoteRepo {
    
    func getPosts()-> AnyPublisher<[PostsModel], Error > {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let posts = SessionManager.instance.request(from: url, [PostsModel].self)
        return posts
    }
    
}
