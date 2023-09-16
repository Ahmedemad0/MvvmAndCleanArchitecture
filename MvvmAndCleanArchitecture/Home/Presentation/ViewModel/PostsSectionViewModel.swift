//
//  PostsSectionViewModel.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 15/09/2023.
//

import Foundation

class PostsSectionViewModel {
    
    var dataSource: [PostsModel]
    
    init(dataSource: [PostsModel]) {
        self.dataSource = dataSource
    }
}
