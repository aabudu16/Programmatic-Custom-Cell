//
//  label-Extenstion.swift
//  Programmatic-Custom-Cell
//
//  Created by Mr Wonderful on 10/9/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    public convenience init(color:UIColor, font:UIFont){
        self.init()
        self.textColor = color
        self.font = font
    }
}
