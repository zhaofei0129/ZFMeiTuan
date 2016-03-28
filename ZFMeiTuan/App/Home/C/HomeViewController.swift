//
//  HomeViewController.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/15.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    var recommendationArray: [HomeRecommendationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initData()
        setNavBar()
        initView()
    }
    
    func initData() {
    }
    
    func setNavBar() {
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = gSystemGreen
        navBar?.barStyle = .Black
        
        // 设置地点Button
        let locationBtn = UIButton(frame: CGRect(x: 10, y: 11, width: 40, height: 22))
        locationBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        locationBtn.setTitle("南京", forState: .Normal)
        locationBtn.addTarget(self, action: #selector(HomeViewController.onLocationBtn(_:)), forControlEvents: .TouchUpInside)
        navBar?.addSubview(locationBtn)
        
        let arrowBtn = UIButton(frame: CGRect(x: CGRectGetMaxX(locationBtn.frame), y: 11, width: 10, height: 22))
        arrowBtn.setImage(UIImage(named: "home_navBar_arrow_up"), forState: .Normal)
        arrowBtn.setImage(UIImage(named: "home_navBar_arrow_down"), forState: .Selected)
        arrowBtn.tag = 100
        arrowBtn.selected = false
        arrowBtn.addTarget(self, action: #selector(HomeViewController.onLocationBtn(_:)), forControlEvents: .TouchUpInside)
        navBar?.addSubview(arrowBtn)
        
        // 设置消息Button
        let msgBtn = UIButton(frame: CGRect(x: gScreenWidth - 10 - 22, y: 11, width: 22, height: 22))
        msgBtn.setImage(UIImage(named: "home_navBar_msg"), forState: .Normal)
        msgBtn.addTarget(self, action: #selector(HomeViewController.onMsgBtn(_:)), forControlEvents: .TouchUpInside)
        navBar?.addSubview(msgBtn)
        
        // 设置扫一扫Button
        let scanningBtn = UIButton(frame: CGRect(x: CGRectGetMinX(msgBtn.frame) - 10 - 22, y: 11, width: 22, height: 22))
        scanningBtn.setImage(UIImage(named: "home_navBar_scanning"), forState: .Normal)
        scanningBtn.addTarget(self, action: #selector(HomeViewController.onScanningBtn(_:)), forControlEvents: .TouchUpInside)
        navBar?.addSubview(scanningBtn)
        
        // 设置搜索框Button
        let searchBtn = UIButton(frame: CGRect(x: CGRectGetMaxX(arrowBtn.frame) + 10, y: 5, width: CGRectGetMinX(scanningBtn.frame) - CGRectGetMaxX(arrowBtn.frame) - 10 - 10, height: 34))
        searchBtn.backgroundColor = UIColor.whiteColor()
        searchBtn.layer.masksToBounds = true
        searchBtn.layer.cornerRadius = 14
        searchBtn.addTarget(self, action: #selector(HomeViewController.onSearchBtn(_:)), forControlEvents: .TouchUpInside)
        navBar?.addSubview(searchBtn)
        
        let searchImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 24, height: 24))
        searchImageView.image = UIImage(named: "home_navBar_search")
        searchBtn.addSubview(searchImageView)
        
        let placeholderLabel = UILabel(frame: CGRect(x: CGRectGetMaxX(searchImageView.frame) + 5, y: 5, width: searchBtn.frame.width - CGRectGetMaxX(searchImageView.frame) - 10 - 5, height: 24))
        placeholderLabel.text = "输入商家、品类、商圈"
        placeholderLabel.textColor = UIColor.grayColor()
        placeholderLabel.font = UIFont.systemFontOfSize(13)
        searchBtn.addSubview(placeholderLabel)
    }
    
    func initView() {
        // 设置tableView
        // tableView = UITableView(frame: CGRect(x: 0, y: 0, width: gScreenWidth, height: gScreenHeight), style: .Grouped)
        tableView = UITableView(frame: view.frame, style: .Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setUpTableView()
    }
    
    func setUpTableView() {
        refreshData()
    }
    
    func refreshData() {
        getRecommenData()
    }
    
    func getRecommenData() {
        let recommendationModel = HomeRecommendationModel()
        recommendationModel.shopImageName = "home_recommend_cell_shop_hanbaowang"
        recommendationModel.distance = 6.2
        recommendationModel.shopName = "汉堡王"
        recommendationModel.shopInfo = "[万谷慧生活广场等]汉堡王草莓新地/巧克力新地买一送一1份"
        recommendationModel.price = 8
        recommendationModel.soldedNumber = 22490
        
        for _ in 0 ..< 10 {
            recommendationArray.append(recommendationModel)
        }
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2:
            return 1
        case 3:
            return 2
        case 4:
            return recommendationArray.count + 1
        default:
            print("default")
            return 0
        }
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 160
        case 1:
            return 128
        case 2:
            return 200
        case 3:
            return indexPath.row == 0 ? 40 : 100
        case 4:
            return indexPath.row == 0 ? 40 : 100
        default:
            print("default")
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 4 {
            return 180
        } else {
            return 10
        }
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 4 {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: gScreenWidth, height: 180))
            
            // 查看全部团购
            let seeAllBtn = UIButton(frame: CGRect(x: 10, y: 10, width: gScreenWidth - 10 - 10, height: 30))
            seeAllBtn.backgroundColor = UIColor.whiteColor()
            seeAllBtn.setTitle("查看全部团购", forState: .Normal)
            seeAllBtn.setTitleColor(gSystemGreen, forState: .Normal)
            seeAllBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
            seeAllBtn.layer.masksToBounds = true
            seeAllBtn.layer.cornerRadius = 3
            seeAllBtn.addTarget(self, action: #selector(HomeViewController.onSeeAllBtn(_:)), forControlEvents: .TouchUpInside)
            footerView.addSubview(seeAllBtn)
            
            // 我的每团DNA
            let backView = UIView(frame: CGRect(x: 10, y: CGRectGetMaxY(seeAllBtn.frame) + 10, width: gScreenWidth - 10 - 10, height: footerView.frame.height - CGRectGetMaxY(seeAllBtn.frame) - 10))
            backView.backgroundColor = UIColor.whiteColor()
            backView.layer.masksToBounds = true
            backView.layer.cornerRadius = 3
            footerView.addSubview(backView)
            
            let backViewLabel = UILabel(frame: CGRect(x: 10, y: 10, width: backView.frame.width - 10 - 10, height: 50))
            backViewLabel.numberOfLines = 2
            backViewLabel.text = "愿意让我们更了解你吗\n让美团的推荐更符合你的胃口"
            backViewLabel.textColor = UIColor.grayColor()
            backViewLabel.font = UIFont.systemFontOfSize(15)
            backViewLabel.textAlignment = .Center
            backView.addSubview(backViewLabel)
            
            let backViewBtn = UIButton(frame: CGRect(x: 10, y: CGRectGetMaxY(backViewLabel.frame) + 10, width: backView.frame.width - 10 - 10, height: 30))
            backViewBtn.backgroundColor = gSystemGreen
            backViewBtn.setTitle("我的美团DNA", forState: .Normal)
            backViewBtn.tintColor = UIColor.whiteColor()
            backViewBtn.layer.masksToBounds = true
            backViewBtn.layer.cornerRadius = 3
            backViewBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
            backViewBtn.addTarget(self, action: #selector(HomeViewController.onBackViewBtn(_:)), forControlEvents: .TouchUpInside)
            backView.addSubview(backViewBtn)
            
            return footerView
        } else {
            return nil
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        if section == 0 {
            // 菜单
            let cellIdentifier = "menuCell"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
            if cell == nil {
                cell = HomeMenuTableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
            }
            cell!.selectionStyle = .None
            return cell!
        } else if section == 1 {
            let cellIdentifier = "cuxiao0Cell"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
            }
            cell?.textLabel?.text = "section1"
            return cell!
        } else if section == 2 {
            let cellIdentifier = "cuxiao1Cell"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
            }
            cell?.textLabel?.text = "section2"
            return cell!
        } else if section == 3 {
            if row == 0 {
                let cellIdentifier = "remenpindaoCell"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
                if cell == nil {
                    cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
                }
                cell?.textLabel?.text = "热门频道"
                cell!.imageView!.image = UIImage(named: "home_cell_hot")
                return cell!
            } else {
                let cellIdentifier = "gezhongpindaoCell"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
                if cell == nil {
                    cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
                }
                cell?.textLabel?.text = "section3 row1"
                return cell!
            }
        } else {
            if row == 0 {
                // 猜你喜欢
                let cellIdentifier = "recommendationCell"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
                if cell == nil {
                    cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
                }
                cell?.textLabel?.text = "猜你喜欢"
                cell!.imageView!.image = UIImage(named: "home_cell_heart")
                cell!.selectionStyle = .None
                return cell!
            } else {
                let cellIdentifier = "recommendationsCell"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! HomeRecommendationTableViewCell?
                if cell == nil {
                    cell = HomeRecommendationTableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
                }
                cell!.setRecommendationModel(recommendationArray[row - 1])
                return cell!
            }
        }
    }
    
    // MARK: Action
    func onLocationBtn(sender: UIButton) {
        let arrowBtn = navigationController?.navigationBar.viewWithTag(100) as! UIButton
        arrowBtn.selected = !arrowBtn.selected
        if arrowBtn.selected {
            print("打开地点view")
        } else {
            print("关闭地点view")
        }
    }
    
    func onMsgBtn(sender: UIButton) {
        print("onMsgBtn")
    }
    
    func onScanningBtn(sender: UIButton) {
        print("onScanningBtn")
    }
    
    func onSearchBtn(sender: UIButton) {
        print("onSearchBtn")
    }
    
    func onSeeAllBtn(sender: UIButton) {
        print("onSeeAllBtn")
    }
    
    func onBackViewBtn(sender: UIButton) {
        print("onBackViewBtn")
    }
    
}
