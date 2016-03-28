//
//  BusinessViewController.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/15.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit

class BusinessViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var maskView: UIView!
    
    var businessArray: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initData()
        setNavBar()
        initView()
    }
    
    func initData() {
        businessArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    }
    
    func setNavBar() {
        navigationController?.navigationBar.tintColor = gSystemGreen
        
        let searchBtnItem = UIBarButtonItem(image: UIImage(named: "business_navBar_search"), style: .Plain, target: self, action: #selector(BusinessViewController.onSearchBtn(_:)))
        navigationItem.rightBarButtonItem = searchBtnItem
        
        let mapBtnItem = UIBarButtonItem(image: UIImage(named: "business_navBar_map"), style: .Plain, target: self, action: #selector(BusinessViewController.onMapBtn(_:)))
        navigationItem.leftBarButtonItem = mapBtnItem
        
        let segment = UISegmentedControl(items: ["全部商家", "优惠商家"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(BusinessViewController.onSegmentBtn(_:)), forControlEvents: .ValueChanged)
        navigationItem.titleView = segment
    }
    
    func initView() {
        // 设置filterView
        let filterView = UIView(frame: CGRect(x: 0, y: 64, width: gScreenWidth, height: 44))
        view.addSubview(filterView)
        let filterName = ["全部分类", "全城", "智能排序"]
        for i in 0 ..< 3 {
            // 文字
            let filterBtn = UIButton(frame: CGRect(x: CGFloat(i) * gScreenWidth / 3, y: 0, width: gScreenWidth / 3, height: 44))
            filterBtn.tag = 100 + i
            filterBtn.selected = false
            filterBtn.setTitle(filterName[i], forState: .Normal)
            filterBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
            filterBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            filterBtn.setTitleColor(gSystemGreen, forState: .Selected)
            filterBtn.addTarget(self, action: #selector(BusinessViewController.OnFilterBtn(_:)), forControlEvents: .TouchUpInside)
            filterView.addSubview(filterBtn)
            
            // 箭头
            let arrowBtn = UIButton(frame: CGRect(x: gScreenWidth / 3 - 10 - 5, y: 0, width: 10, height: 44))
            arrowBtn.tag = 120 + i
            arrowBtn.userInteractionEnabled = false
            arrowBtn.selected = false
            arrowBtn.setImage(UIImage(named: "business_arrow_down"), forState: .Normal)
            arrowBtn.setImage(UIImage(named: "business_arrow_up_selected"), forState: .Selected)
            filterBtn.addSubview(arrowBtn)
            
            // 竖线
            let verticalLine = UIView(frame: CGRect(x: CGFloat(i + 1) * gScreenWidth / 3, y: 5, width: 0.5, height: 34))
            verticalLine.backgroundColor = UIColor.grayColor()
            filterView.addSubview(verticalLine)
        }
        
        // 设置tableView
        tableView = UITableView(frame: CGRect(x: 0, y: 64 + 44, width: gScreenWidth, height: gScreenHeight - 64 - 44 - 48), style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        // 遮罩页
        maskView = UIView(frame: CGRect(x: 0, y: 64 + 44, width: gScreenWidth, height: gScreenHeight - 64 - 48 - 44))
        maskView.backgroundColor = RGBA(r: 0, g: 0, b: 0, a: 0.5)
        view.addSubview(maskView)
        maskView.hidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(BusinessViewController.onTapMaskView(_:)))
        maskView.addGestureRecognizer(tap)
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessArray.count
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: gScreenWidth, height: 30))
        headerView.backgroundColor = RGB(r: 240, g: 240, b: 240)
        
        let refreshBtn = UIButton(frame: CGRect(x: gScreenWidth - 10 - 10, y: 10, width: 10, height: 10))
        refreshBtn.setImage(UIImage(named: "business_refresh"), forState: .Normal)
        refreshBtn.addTarget(self, action: #selector(BusinessViewController.onRefrshBtn(_:)), forControlEvents: .TouchUpInside)
        headerView.addSubview(refreshBtn)
        
        let addressLabel = UILabel(frame: CGRect(x: 10, y: 0, width: CGRectGetMinX(refreshBtn.frame) - 10 - 10, height: 30))
        addressLabel.numberOfLines = 2
        let addressStr = "栖霞区尧新大道博西华电器（江苏）有限公司南京工厂"
        addressLabel.text = "当前： \(addressStr)附近"
        addressLabel.textColor = UIColor.grayColor()
        addressLabel.font = UIFont.systemFontOfSize(12)
        headerView.addSubview(addressLabel)
        
        return headerView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "businessCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = businessArray[indexPath.row] as? String
        return cell!
    }
    
    // MARK: Action
    func onMapBtn(sender: UIButton) {
        print("onMapBtn")
    }
    
    func onSearchBtn(sender: UIButton) {
        print("onSearchBtn")
    }
    
    func onSegmentBtn(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("全部商家")
        } else {
            print("优惠商家")
        }
    }
    
    func OnFilterBtn(sender: UIButton) {
        print("OnFilterBtn")
        if sender.selected == true {
            sender.selected = false
            let clickedArrowBtn = view.viewWithTag(sender.tag + 20) as! UIButton
            clickedArrowBtn.selected = false
            maskView.hidden = true
        } else {
            for i in 0 ..< 3 {
                let filterBtn = view.viewWithTag(100 + i) as! UIButton
                filterBtn.selected = false
                let arrowBtn = view.viewWithTag(120 + i) as! UIButton
                arrowBtn.selected = false
            }
            sender.selected = true
            let clickedArrowBtn = view.viewWithTag(sender.tag + 20) as! UIButton
            clickedArrowBtn.selected = true
            maskView.hidden = false
        }
        
        switch sender.tag {
        case 100:
            print("打开全部分类")
        case 101:
            print("打开全城")
        case 102:
            print("打开智能排序")
        default:
            print("default")
        }
    }
    
    func onTapMaskView(sender: UITapGestureRecognizer) {
        maskView.hidden = true
        for i in 0 ..< 3 {
            let filterBtn = view.viewWithTag(100 + i) as! UIButton
            filterBtn.selected = false
            let arrowBtn = view.viewWithTag(120 + i) as! UIButton
            arrowBtn.selected = false
        }
    }
    
    func onRefrshBtn(sender: UIButton) {
        print("onRefrshBtn")
    }
    
}
