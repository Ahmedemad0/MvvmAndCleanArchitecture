//
//  HomeViewController.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 13/09/2023.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: HomeViewModelProtocol
    private var dataSources: PostsDataSources?
    var anyCancellable = Set<AnyCancellable>()
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        viewModel.viewDidLoad()
        bindToViewModel()
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
    }
    
    private func setDelegates(){
        tableView.dataSource = dataSources
        tableView.delegate = dataSources
        tableView.reloadData()
    }
    
    private func bindToViewModel(){
        viewModel.output.$posts.sink { finished in
            print(finished)
        } receiveValue: { [unowned self] posts in
            let postsSectionViewModel = PostsSectionViewModel(dataSource: posts)
            self.dataSources = .init(postsSectionViewModel)
            self.setDelegates()
        }.store(in: &anyCancellable)
    }
}
