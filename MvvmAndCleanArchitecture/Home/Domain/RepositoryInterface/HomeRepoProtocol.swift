//
//  HomeRepoProtocol.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 13/09/2023.
//

import Foundation
import Combine

protocol HomeRepoProtocol {
    func getPosts()-> AnyPublisher<[PostsModel], Error >
}
