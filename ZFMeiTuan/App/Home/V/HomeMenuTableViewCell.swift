//
//  HomeMenuTableViewCell.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/18.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit

class HomeMenuTableViewCell: UITableViewCell, UIScrollViewDelegate {
    
    var pageControl: UIPageControl!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let menuArray = [
            ["image" : "home_cell_meishi", "title" : "美食"],
            ["image" : "home_cell_dianying", "title" : "电影"],
            ["image" : "home_cell_jiudian", "title" : "酒店"],
            ["image" : "home_cell_xiuxianyule", "title" : "休闲娱乐"],
            ["image" : "home_cell_waimai", "title" : "外卖"],
            ["image" : "home_cell_zizhucan", "title" : "自助餐"],
            ["image" : "home_cell_KTV", "title" : "KTV"],
            ["image" : "home_cell_huochepiaojipiao", "title" : "火车票机票"],
            ["image" : "home_cell_xican", "title" : "西餐"],
            ["image" : "home_cell_liren", "title" : "丽人"],
            ["image" : "home_cell_meifa", "title" : "美发"],
            ["image" : "home_cell_meijia", "title" : "美甲"],
            ["image" : "home_cell_zhoubianyou", "title" : "周边游"],
            ["image" : "home_cell_zuliaoanmo", "title" : "足疗按摩"],
            ["image" : "home_cell_xiyuhanzheng", "title" : "洗浴/汗蒸"],
            ["image" : "home_cell_jinrixindan", "title" : "今日新单"],
            ["image" : "home_cell_xiaochikuaican", "title" : "小吃快餐"],
            ["image" : "home_cell_gouwu", "title" : "购物"],
            ["image" : "home_cell_lvyou", "title" : "旅游"],
            ["image" : "home_cell_quanbufenlei", "title" : "全部分类"]
        ]
        
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
        
        for i in 0 ..< menuArray.count {
            if i < 5 {
                let imageName = menuArray[i]["image"]
                let title = menuArray[i]["title"]
                let menuBtn = HomeMenuBtn(frame: CGRect(x: CGFloat(i) * gScreenWidth / 5, y: 0, width: gScreenWidth / 5, height: 70), imageName: imageName!, title: title!)
                menuBtn.tag = 10 + i
                menuBtn.addTarget(self, action: #selector(HomeMenuTableViewCell.onMenuBtn(_:)), forControlEvents: .TouchUpInside)
                backView0.addSubview(menuBtn)
            } else if i < 10 {
                let imageName = menuArray[i]["image"]
                let title = menuArray[i]["title"]
                let menuBtn = HomeMenuBtn(frame: CGRect(x: CGFloat(i - 5) * gScreenWidth / 5, y: 70, width: gScreenWidth / 5, height: 70), imageName: imageName!, title: title!)
                menuBtn.tag = 10 + i
                menuBtn.addTarget(self, action: #selector(HomeMenuTableViewCell.onMenuBtn(_:)), forControlEvents: .TouchUpInside)
                backView0.addSubview(menuBtn)
            } else if i < 15 {
                let imageName = menuArray[i]["image"]
                let title = menuArray[i]["title"]
                let menuBtn = HomeMenuBtn(frame: CGRect(x: CGFloat(i - 10) * gScreenWidth / 5, y: 0, width: gScreenWidth / 5, height: 70), imageName: imageName!, title: title!)
                menuBtn.tag = 10 + i
                menuBtn.addTarget(self, action: #selector(HomeMenuTableViewCell.onMenuBtn(_:)), forControlEvents: .TouchUpInside)
                backView1.addSubview(menuBtn)
            } else {
                let imageName = menuArray[i]["image"]
                let title = menuArray[i]["title"]
                let menuBtn = HomeMenuBtn(frame: CGRect(x: CGFloat(i - 15) * gScreenWidth / 5, y: 70, width: gScreenWidth / 5, height: 70), imageName: imageName!, title: title!)
                menuBtn.tag = 10 + i
                menuBtn.addTarget(self, action: #selector(HomeMenuTableViewCell.onMenuBtn(_:)), forControlEvents: .TouchUpInside)
                backView1.addSubview(menuBtn)
            }
        }
        
        pageControl = UIPageControl(frame: CGRect(x: gScreenWidth / 2 - 20, y: 140, width: 40, height: 20))
        pageControl.currentPage = 0
        pageControl.numberOfPages = 2
        pageControl.currentPageIndicatorTintColor = gSystemGreen
        pageControl.pageIndicatorTintColor = UIColor.grayColor()
        pageControl.addTarget(self, action: #selector(HomeMenuTableViewCell.onPageControl(_:)), forControlEvents: .ValueChanged)
        self.contentView.addSubview(pageControl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Action
    func onMenuBtn(sender: UIButton) {
        print(sender.tag)
    }
    
    func onPageControl(sender: UIPageControl) {
        // pageControl.currentPage = sender.currentPage
        print(sender.currentPage)
    }
    
    // MARK: UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollViewWidth = scrollView.frame.width
        let x = scrollView.contentOffset.x
        let page = Int((x + scrollViewWidth / 2) / scrollViewWidth)
        pageControl.currentPage = page
        print(page)
    }
    
}
