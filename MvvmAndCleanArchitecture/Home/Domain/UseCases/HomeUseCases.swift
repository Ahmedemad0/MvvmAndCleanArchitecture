//
//  HomeUseCases.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 13/09/2023.
//

import Foundation
import Combine

class HomeUseCases {
    
    private let repo: HomeRepoProtocol
    
    init(repo: HomeRepoProtocol = HomeRepoImplementation()) {
        self.repo = repo
    }
    
    func getPosts()-> AnyPublisher<[PostsModel], Error >{
        repo.getPosts()
    }
}
