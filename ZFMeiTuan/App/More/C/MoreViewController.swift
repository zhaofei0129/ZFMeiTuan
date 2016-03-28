//
//  MoreViewController.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/15.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    var dataSourceArray: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initData()
        setNavBar()
        initView()
    }
    
    func setNavBar() {
        title = "更多"
    }
    
    func initData() {
        dataSourceArray = [
            ["扫一扫"],
            ["省流量模式", "消息提醒", "邀请好友使用美团", "清空缓存"],
            ["意见反馈", "问卷调查", "支付帮助", "网络诊断", "关于美团", "我要应聘"],
            ["精品应用"]
        ]
    }
    
    func initView() {
        // 设置tableView
        tableView = UITableView(frame: view.frame, style: .Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray[section].count
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        } else {
            return 0.0001
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let cellIndentifier = "moreCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIndentifier)
        }
        cell?.textLabel?.text = dataSourceArray[section].objectAtIndex(row) as? String
        cell?.textLabel?.font = UIFont.systemFontOfSize(15)
        cell?.accessoryType = .DisclosureIndicator
        
        if section == 1 && row == 0 {
            cell?.accessoryType = .None
            let flowSwitch = UISwitch()
            flowSwitch.center = CGPoint(x: gScreenWidth - 10 - flowSwitch.frame.width / 2, y: 22)
            flowSwitch.onTintColor = gSystemGreen
            flowSwitch.addTarget(self, action: #selector(MoreViewController.onSwitch(_:)), forControlEvents: .ValueChanged)
            cell?.contentView.addSubview(flowSwitch)
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let section = indexPath.section
        let row = indexPath.row
        switch(section) {
        case 0:
            print(dataSourceArray[section])
        case 1:
            switch row {
            case 0:
                print("default")
            case 1:
                print(dataSourceArray[section].objectAtIndex(row))
            case 2:
                print(dataSourceArray[section].objectAtIndex(row))
            case 3:
                print(dataSourceArray[section].objectAtIndex(row))
            default:
                print("default")
            }
        case 2:
            switch row {
            case 0:
                print(dataSourceArray[section].objectAtIndex(row))
            case 1:
                print(dataSourceArray[section].objectAtIndex(row))
            case 2:
                print(dataSourceArray[section].objectAtIndex(row))
            case 3:
                print(dataSourceArray[section].objectAtIndex(row))
            case 4:
                print(dataSourceArray[section].objectAtIndex(row))
            case 5:
                print(dataSourceArray[section].objectAtIndex(row))
            default:
                print("default")
            }
        case 3:
            print(dataSourceArray[section].objectAtIndex(row))
        default:
            print("default")
        }
    }
    
    // MARK: Action
    func onSwitch(sender: UISwitch) {
        if sender.on {
            print("switch on")
        } else {
            print("switch off")
        }
    }
}
