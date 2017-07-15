//
//  CGSize+Extensions.swift
//  Generals
//
//  Created by Mihai Arosoaie on 14/07/2017.
//  Copyright © 2017 Mihai Arosoaie. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
    
    func byMultiplying(with size: CGSize) -> CGSize {
        return CGSize(width: width * size.width, height: height * size.height)
    }
    
    static func *(size: CGSize, multiplier: CGFloat) -> CGSize {
        return CGSize(width: size.width * multiplier, height: size.height * multiplier)
    }
    
    static func +(size: CGSize, l: CGFloat) -> CGSize {
        return CGSize(width: size.width + l, height: size.height + l)
    }
    
    static func -(size: CGSize, l: CGFloat) -> CGSize {
        return CGSize(width: size.width - l, height: size.height - l)
    }
    
    
    static func *(left: CGSize, right: CGSize) -> CGSize {
        return CGSize(width: left.width * right.width, height: left.height * right.height)
    }
    
    static func +(left: CGSize, right: CGSize) -> CGSize {
        return CGSize(width: left.width + right.width, height: left.height + right.height)
    }
    
    static func -(left: CGSize, right: CGSize) -> CGSize {
        return CGSize(width: left.width - right.width, height: left.height - right.height)
    }
}



