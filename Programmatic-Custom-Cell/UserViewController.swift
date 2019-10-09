//
//  ViewController.swift
//  Programmatic-Custom-Cell
//
//  Created by Mr Wonderful on 10/8/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var randomUser = [User](){
        didSet{
            DispatchQueue.main.async {
                self.userCollectionView.reloadData()
            }
        }
    }
    
    enum Identifier:String{
        case collectionViewCell
        case DetailedViewController
    }
    
    var layout = UICollectionViewFlowLayout.init()
    lazy var userCollectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RandomUserCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.collectionViewCell.rawValue )
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.addSubview(userCollectionView)
        fetchData()
        setContrainsts()
    }

    func fetchData(){
        RandomUserAPIClient.shared.getData { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case.success(let user):
                DispatchQueue.main.async {
                     self.randomUser = user
                }
            }
        }
    }
    func setContrainsts(){
        self.userCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.userCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.userCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.userCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.userCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}
extension UserViewController:UICollectionViewDelegate{}
extension UserViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomUser.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = userCollectionView.dequeueReusableCell(withReuseIdentifier: Identifier.collectionViewCell.rawValue, for: indexPath) as? RandomUserCollectionViewCell else {return UICollectionViewCell()}
        
        let info = randomUser[indexPath.row]
        cell.nameLabel.text = info.name.first
        
        ImageHelper.shared.getImage(urlStr: info.picture.large) { (result) in
            switch result{
            case .failure(let error):
                print(error)
            case.success(let image):
                DispatchQueue.main.async {
                    cell.createImageView.image = image
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedVC = DetailedViewController()
        let info = randomUser[indexPath.row]
        //detailedVC.randomUserDetail = info
        
        self.navigationController?.pushViewController(detailedVC, animated: true)
    }
}
extension UserViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let virticalCellCGSize = CGSize(width: 250, height: 250)
        return virticalCellCGSize
}
}
