//
//  ImageView-Extenstion.swift
//  Programmatic-Custom-Cell
//
//  Created by Mr Wonderful on 10/9/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView{
    public convenience init(cornerRadius: CGFloat, contentMode:UIView.ContentMode){
        self.init()
        self.contentMode = contentMode
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
