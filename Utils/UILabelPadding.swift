//
//  UILabelPadding.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/4/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import Foundation
import UIKit

class UILabelPadding: UILabel {
    
    let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, padding))
    }
    
    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right * 20
        let heigth = superContentSize.height + padding.top + padding.bottom * 20
        return CGSize(width: width, height: heigth)
    }
    
    
    
}


