//
//  RandomUserTableViewCell.swift
//  Programmatic-Custom-Cell
//
//  Created by Mr Wonderful on 10/8/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class RandomUserTableViewCell: UITableViewCell {

    
    let nameLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    let createImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
