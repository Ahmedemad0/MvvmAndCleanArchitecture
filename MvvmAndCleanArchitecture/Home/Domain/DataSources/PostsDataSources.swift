//
//  PostsDataSources.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 15/09/2023.
//

import UIKit

class PostsDataSources: NSObject, UITableViewDelegate, UITableViewDataSource {
    private let postsViewModel: PostsSectionViewModel
    init(_ postsViewModel: PostsSectionViewModel) {
        self.postsViewModel = postsViewModel
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsViewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as! PostsTableViewCell
        cell.configureCell(model: postsViewModel.dataSource[indexPath.row])
        return cell
    }
    
    
}
