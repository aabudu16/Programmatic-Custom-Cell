//
//  RandomUserCollectionViewCell.swift
//  Programmatic-Custom-Cell
//
//  Created by Mr Wonderful on 10/8/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class RandomUserCollectionViewCell: UICollectionViewCell {
    let nameLabel:UILabel = {
        let label = UILabel(color: .blue, font: .italicSystemFont(ofSize: 20))
        return label
    }()
    
    let createImageView: UIImageView = {
        let imageView = UIImageView(cornerRadius: 50, contentMode: .scaleAspectFill)
        return imageView
    }()
    
    override init (frame:CGRect){
        super.init(frame:frame)
        setupView()
        configureConstraints()
        
    }
    
   func setupView(){
    self.contentView.addSubview(nameLabel)
    self.contentView.addSubview(createImageView)
    }
    
    func  configureConstraints(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.createImageView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        
        createImageView.translatesAutoresizingMaskIntoConstraints = false
        createImageView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        createImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        createImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        createImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        createImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

