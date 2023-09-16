//
//  PostsTableViewCell.swift
//  MvvmAndCleanArchitecture
//
//  Created by Ahmed Emad on 15/09/2023.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak  var describtion: UILabel!

    func configureCell(model: PostsModel){
        title.text = model.title
        describtion.text = model.body
    }
    
}
