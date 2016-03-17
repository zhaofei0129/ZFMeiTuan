//
//  MineViewController.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/15.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit

class MineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setNavBar()
        initView()
    }
    
    func setNavBar() {
        title = "我的"
        
        let navBar = navigationController?.navigationBar
        // 消息按钮
        let msgBtn = UIButton(frame: CGRect(x: gScreenWidth - 10 - 22, y: 11, width: 22, height: 22))
        msgBtn.setImage(UIImage(named: "mine_navBar_msg"), forState: .Normal)
        msgBtn.addTarget(self, action: "onMsgBtn:", forControlEvents: .TouchUpInside)
        navBar?.addSubview(msgBtn)
        
        // 设置按钮
        let settingBtn = UIButton(frame: CGRect(x: CGRectGetMinX(msgBtn.frame) - 15 - 22, y: 11, width: 22, height: 22))
        settingBtn.setImage(UIImage(named: "mine_navBar_setting"), forState: .Normal)
        settingBtn.addTarget(self, action: "onSettingBtn:", forControlEvents: .TouchUpInside)
        navBar?.addSubview(settingBtn)
    }
    
    func initView() {
        tableView = UITableView(frame: view.frame, style: .Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: NSInteger) -> NSInteger {
        switch section {
        case 0, 1, 2:
            return 2
        case 3, 4, 5:
            return 1
        default:
            return 0
        }
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForHeaderInSection section: NSInteger) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: NSInteger) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let section = indexPath.section
        let row = indexPath.row
        if (section == 0 && row == 0) || (section == 1 && row == 1) {
            return 66
        } else {
            return 44
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let cellIndentifier = "mineCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIndentifier)
        }
        
        cell!.accessoryType = .DisclosureIndicator
        switch section {
        case 0:
            cell!.textLabel?.textColor = UIColor.whiteColor()
            cell!.backgroundColor = gSystemGreen
            cell!.accessoryType = .None
            cell?.selectionStyle = .None
            switch row {
            case 0:
                let headBtn = UIButton(frame: CGRect(x: 10, y: 10, width: 46, height: 46))
                headBtn.setImage(UIImage(named: "mine_cell_head"), forState: .Normal)
                headBtn.addTarget(self, action: "onPersonalBtn:", forControlEvents: .TouchUpInside)
                cell!.contentView.addSubview(headBtn)
                
                let nameBtn = UIButton(frame: CGRect(x: CGRectGetMaxX(headBtn.frame) + 10, y: 10, width: 100, height: 46))
                nameBtn.addTarget(self, action: "onPersonalBtn:", forControlEvents: .TouchUpInside)
                nameBtn.setTitle("请点击登录", forState: .Normal)
                nameBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
                nameBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                cell!.contentView.addSubview(nameBtn)
            case 1:
                // 美团券 评价 收藏
                let btnNames = ["美团券", "评价", "收藏"]
                for var i = 0; i < 3; i++ {
                    let btn = UIButton(frame: CGRect(x: CGFloat(i) * gScreenWidth / 3, y: 0, width: gScreenWidth / 3, height: 44))
                    btn.tag = 100 + i
                    btn.setTitle(btnNames[i], forState: .Normal)
                    btn.titleLabel?.font = UIFont.systemFontOfSize(15)
                    btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
                    btn.addTarget(self, action: "onBtn:", forControlEvents: .TouchUpInside)
                    cell!.contentView.addSubview(btn)
                    
                    // 竖线
                    let verticalLine = UIView(frame: CGRect(x: CGFloat(i + 1) * gScreenWidth / 3, y: 5, width: 0.5, height: 34))
                    verticalLine.backgroundColor = UIColor.whiteColor()
                    cell!.contentView.addSubview(verticalLine)
                }
            default:
                print("default")
            }
        case 1:
            switch row {
            case 0:
                cell!.textLabel!.text = "我的订单"
                cell!.imageView!.image = UIImage(named: "mine_cell_myOrder")
            case 1:
                // 待付款 待使用 待评价 退款/售后
                let serviceNames = ["待付款", "待使用", "待评价", "退款/售后"]
                for var i = 0; i < 4; i++ {
                    let serviceBtn = UIButton(frame: CGRect(x: CGFloat(i) * gScreenWidth / 4, y: 0, width: gScreenWidth / 4, height: 66))
                    serviceBtn.tag = 110 + i
                    serviceBtn.addTarget(self, action: "onServiceBtn:", forControlEvents: .TouchUpInside)
                    cell!.contentView.addSubview(serviceBtn)
                    
                    let serviceImageView = UIImageView(frame: CGRect(x: 0, y: 10, width: gScreenWidth / 4, height: 20))
                    serviceImageView.image = UIImage(named: "mine_cell_service_\(i)")
                    serviceBtn.addSubview(serviceImageView)
                    
                    let serviceLabel = UILabel(frame: CGRect(x: 0, y: 35, width: gScreenWidth / 4, height: 21))
                    serviceLabel.text = serviceNames[i]
                    serviceLabel.font = UIFont.systemFontOfSize(15)
                    serviceLabel.textColor = UIColor.grayColor()
                    serviceLabel.textAlignment = .Center
                    serviceBtn.addSubview(serviceLabel)
                }
                cell!.accessoryType = .None
                cell?.selectionStyle = .None
            default:
                print("default")
            }
        case 2:
            switch row {
            case 0:
                cell!.textLabel!.text = "美团钱包"
                cell!.imageView!.image = UIImage(named: "mine_cell_wallet")
            case 1:
                cell!.textLabel!.text = "抵用券"
                cell!.imageView!.image = UIImage(named: "mine_cell_voucher")
            default:
                print("default")
            }
        case 3:
            cell!.textLabel!.text = "积分商城"
            cell!.imageView!.image = UIImage(named: "mine_cell_pointsMall")
        case 4:
            cell!.textLabel!.text = "今日推荐"
            cell!.imageView!.image = UIImage(named: "mine_cell_todayRecommend")
        case 5:
            cell!.textLabel!.text = "我要合作"
            cell!.imageView!.image = UIImage(named: "mine_cell_cooperation")
        default:
            print("default")
        }
        
        return cell!
    }
    
    // MARK: Action
    func onMsgBtn(sender: UIButton) {
        print("onMsgBtn")
    }
    
    func onSettingBtn(sender: UIButton) {
        print("onSettingBtn")
    }
    
    func onPersonalBtn(sender: UIButton) {
        print("onPersonalBtn")
    }
    
    func onBtn(sender: UIButton) {
        switch sender.tag {
        case 100:
            print("美团券")
        case 101:
            print("评价")
        case 102:
            print("收藏")
        default:
            print("default")
        }
    }
    
    func onServiceBtn(sender: UIButton) {
        switch sender.tag {
        case 110:
            print("待付款")
        case 111:
            print("待使用")
        case 112:
            print("待评价")
        case 113:
            print("退款/售后")
        default:
            print("default")
        }
    }
    
}
