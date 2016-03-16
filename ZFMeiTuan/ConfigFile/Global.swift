//
//  Global.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/15.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit

func RGBA(r r: Float, g: Float, b: Float, a: Float) -> UIColor {
    return UIColor(colorLiteralRed: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func RGB(r r: Float, g: Float, b: Float) -> UIColor {
    return RGBA(r: r, g: g, b: b, a: 1.0)
}

let gSystemGreen = RGB(r: 54, g: 185, b: 175)

let gScreenWidth = UIScreen.mainScreen().bounds.width
let gScreenHeight = UIScreen.mainScreen().bounds.height

let gStatusBarHeight: CGFloat = 20.0
let gNavBarHeight: CGFloat = 44.0
let gTabBarHeight: CGFloat = 48.0


