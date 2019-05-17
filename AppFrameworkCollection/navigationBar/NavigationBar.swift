//
//  NavigationBar.swift
//  AppFrameworkCollection
//
//  Created by DingYD on 2019/5/16.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import UIKit
let NavigationBarHeightIncrease: CGFloat = 40.0
let CommonInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
func AppFont(size: CGFloat = 18) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}
extension UIColor {
    // https://github.com/yeahdongcn/UIColor-Hex-Swift/blob/master/HEXColor/UIColorExtension.swift
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

class NavigationBar: UINavigationBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isTranslucent = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var supSize = super.sizeThatFits(size)
        supSize.height = 100
        return supSize
    }
}
