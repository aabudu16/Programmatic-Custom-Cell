//
//  DetailedViewController.swift
//  Programmatic-Custom-Cell
//
//  Created by Mr Wonderful on 10/9/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var randomUserDetail:User! {
        didSet{
            nameLabel.text = randomUserDetail.name.first
            emailLabel.text = "Email \(randomUserDetail.email)"
            dobLabel.text = "Age:  \(randomUserDetail.dob.age)"
            
//            dump(randomUserDetail)
            
            ImageHelper.shared.getImage(urlStr: randomUserDetail.picture.large) { (result) in
                switch result{
                case .failure(let error):
                    print(error)
                case .success(let image):
                    DispatchQueue.main.async {
                       self.detailedImage.image = image
                    }
                }
            }
        }
    }
    let nameLabel:UILabel = {
        let label = UILabel(color: .black, font: .italicSystemFont(ofSize: 20))
        return label
    }()
    
    let emailLabel:UILabel = {
        let label = UILabel(color: .black, font: .italicSystemFont(ofSize: 20))
        return label
    }()
    
    let dobLabel:UILabel = {
        let label = UILabel(color: .black, font: .italicSystemFont(ofSize: 20))
        return label
    }()
    
    let detailedImage:UIImageView = {
        let image = UIImageView(cornerRadius: 10, contentMode: .scaleAspectFill)
        image.layer.cornerRadius = 50
        return image
    }()
    
    // stackView function
    private  func MainStackView() -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: [detailedImage, nameLabel, emailLabel, dobLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
        return stackView
    }
    
    lazy var stackView:UIStackView = {
        return MainStackView()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1)
    }
    
    
    
}
