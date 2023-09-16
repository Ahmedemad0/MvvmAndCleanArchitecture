//
//  HomeRepoImplementation.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 13/09/2023.
//

import Foundation
import Combine

final class HomeRepoImplementation: HomeRepoProtocol {
    
    let homeNetwork: HomeRemoteRepo
    
    init(homeNetwork: HomeRemoteRepo = HomeNetwork()) {
        self.homeNetwork = homeNetwork
    }
    
    
    func getPosts() -> AnyPublisher<[PostsModel], Error> {
        homeNetwork.getPosts()
    }
}
