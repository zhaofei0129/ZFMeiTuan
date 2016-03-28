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

// MARK: UILabel
/*
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
label.text = "label"
label.textColor = UIColor.greenColor()
label.textAlignment = .Center
label.numberOfLines = 2
label.lineBreakMode = .ByWordWrapping
label.font = UIFont.systemFontOfSize(12)
cell?.contentView.addSubview(label)
*/

// MARK: UIButton
/*
let locationBtn = UIButton(frame: CGRect(x: 10, y: 11, width: 40, height: 22))
arrowBtn.userInteractionEnabled = false
locationBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
locationBtn.setTitle("南京", forState: .Normal)
filterBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
locationBtn.setImage(UIImage(named: "home_navBar_arrow_up"), forState: .Normal)
locationBtn.setImage(UIImage(named: "home_navBar_arrow_down"), forState: .Selected)
locationBtn.tag = 100
searchBtn.backgroundColor = UIColor.whiteColor()
searchBtn.layer.masksToBounds = true
searchBtn.layer.cornerRadius = 14
locationBtn.selected = false
locationBtn.addTarget(self, action: "onLocationBtn:", forControlEvents: .TouchUpInside)
navBar?.addSubview(locationBtn)
*/

// MARK: UIImageView
/*
let searchImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 24, height: 24))
searchImageView.image = UIImage(named: "home_navBar_search")
searchBtn.addSubview(searchImageView)
*/

// MARK: UIView
/*
let backView = UIView(frame: CGRect(x: 10, y: CGRectGetMaxY(seeAllBtn.frame) + 10, width: gScreenWidth - 10 - 10, height: footerView.frame.height - CGRectGetMaxY(seeAllBtn.frame) - 10))
backView.backgroundColor = UIColor.whiteColor()
backView.layer.masksToBounds = true
backView.layer.cornerRadius = 3
footerView.addSubview(backView)
*/

// MARK: UIScrollView
/*
let backView0 = UIView(frame: CGRect(x: 0, y: 0, width: gScreenWidth, height: 140))
let backView1 = UIView(frame: CGRect(x: gScreenWidth, y: 0, width: gScreenWidth, height: 140))
let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: gScreenWidth, height: 160))
scrollView.contentSize = CGSizeMake(2 * gScreenWidth, 160)
scrollView.pagingEnabled = true
scrollView.delegate = self
scrollView.showsHorizontalScrollIndicator = false
scrollView.showsVerticalScrollIndicator = false
scrollView.addSubview(backView0)
scrollView.addSubview(backView1)
self.contentView.addSubview(scrollView)
*/

// MARK: UIPageControl
/*
pageControl = UIPageControl(frame: CGRect(x: gScreenWidth / 2 - 20, y: 140, width: 40, height: 20))
pageControl.currentPage = 0
pageControl.numberOfPages = 2
pageControl.currentPageIndicatorTintColor = gSystemGreen
pageControl.pageIndicatorTintColor = UIColor.grayColor()
pageControl.addTarget(self, action: "onPageControl:", forControlEvents: .ValueChanged)
self.contentView.addSubview(pageControl)
*/

// MARK: UISegmentedControl
/*
let segment = UISegmentedControl(items: ["全部商家", "优惠商家"])
segment.selectedSegmentIndex = 0
segment.addTarget(self, action: "onSegmentBtn:", forControlEvents: .ValueChanged)
navigationItem.titleView = segment
*/
