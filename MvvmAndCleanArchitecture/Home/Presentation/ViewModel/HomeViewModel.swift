//
//  HomeViewModel.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 13/09/2023.
//

import Foundation
import Combine

protocol ViewModel: AnyObject {
    associatedtype Input
    associatedtype Output
}

protocol HomeViewModelProtocol {
    var input: HomeViewModel.Input {get}
    var output: HomeViewModel.Output {get}
    func viewDidLoad()
}
class HomeViewModel: ObservableObject, HomeViewModelProtocol, ViewModel {
    
    class Input {
        
    }
    
    class Output {
        @Published var posts: [PostsModel] = []
    }
   
    var input: Input = .init()
    var output: Output = .init()
    var anyCancellable = Set<AnyCancellable>()
    let useCases: HomeUseCases
    
    init(useCases: HomeUseCases = HomeUseCases()) {
        self.useCases = useCases
    }
    
    func viewDidLoad(){
        callPosts()
    }
    
    private func callPosts(){
        useCases.getPosts().receive(on: DispatchQueue.main)
            .sink { finished in
                print(finished)
            } receiveValue: {[unowned self] posts in
                self.output.posts = posts
            }.store(in: &anyCancellable)

    }
}
