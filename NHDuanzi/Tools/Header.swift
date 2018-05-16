//
//  Header.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit
import SnapKit

//MARK: --------------------常量--------------------

let MAIN_SCREEN_WIDTH = UIScreen.main.bounds.size.width
let MAIN_SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let IS_IPHONE = (MAIN_SCREEN_HEIGHT > 812.0)
let NAVIGATIONBAR_HEIGHT = CGFloat(IS_IPHONE ? 88.0 : 64.0)
let TABBAR_HEIGHT = CGFloat(IS_IPHONE ? 83.0 : 49.0)

//MARK: --------------------方法--------------------

public let RGBColor:((Float,Float,Float,Float)->UIColor) = {(r:Float,g:Float,b:Float,a:Float) -> UIColor in
    return UIColor(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(r)/255.0), blue: CGFloat(CGFloat(r)/255.0), alpha: CGFloat(a))
}

