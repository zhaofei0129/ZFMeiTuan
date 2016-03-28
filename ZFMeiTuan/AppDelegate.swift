//
//  AppDelegate.swift
//  ZFMeiTuan
//
//  Created by 赵飞 on 16/3/15.
//  Copyright © 2016年 赵飞. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    // 经纬度
    var latitude = 39.98350
    var longitude = 116.31804
    var locationManager: CLLocationManager!
    
    var window: UIWindow?
    
    func getLocation() {
        // 1. 实例化CLLocationManager
        locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            // 2. 设置代理
            locationManager.delegate = self
            // 3. 设置精度
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // 4. 设置距离过滤器
            locationManager.distanceFilter = 0.1
            // 5. 请求警示 须在plist中也写
            if #available(iOS 8.0, *) {
                locationManager.requestWhenInUseAuthorization()
            } else {
                // Fallback on earlier versions
            }
            // 6. 开启定位服务
            locationManager.startUpdatingLocation()
        } else {
            print("没有开启定位服务")
        }
    }
    
    func getRootViewController() -> UIViewController {
        // 设置tabBarController
        let rootVC = UITabBarController()
        
        // 设置VCs
        let vc0 = HomeViewController()
        let nc0 = UINavigationController(rootViewController: vc0)
        let vc1 = BusinessViewController()
        let nc1 = UINavigationController(rootViewController: vc1)
        let vc2 = MineViewController()
        let nc2 = UINavigationController(rootViewController: vc2)
        let vc3 = MoreViewController()
        let nc3 = UINavigationController(rootViewController: vc3)
        rootVC.setViewControllers([nc0, nc1, nc2, nc3], animated: true)
        
        // 设置tabBar
        let tabBar =  rootVC.tabBar
        tabBar.tintColor = gSystemGreen
        let item0 = tabBar.items![0]
        item0.title = "首页"
        item0.image = UIImage(named: "tabBar_home")
        item0.selectedImage = UIImage(named: "tabBar_home_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        let item1 = tabBar.items![1]
        item1.title = "商家"
        item1.image = UIImage(named: "tabBar_business")
        item1.selectedImage = UIImage(named: "tabBar_business_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        let item2 = tabBar.items![2]
        item2.title = "我的"
        item2.image = UIImage(named: "tabBar_mine")
        item2.selectedImage = UIImage(named: "tabBar_mine_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        let item3 = tabBar.items![3]
        item3.title = "更多"
        item3.image = UIImage(named: "tabBar_more")
        item3.selectedImage = UIImage(named: "tabBar_more_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        
        return rootVC
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        window?.rootViewController = getRootViewController()
        window?.makeKeyAndVisible()
        getLocation()
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("NMD")
    }
    
//    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        // 6. 开启定位服务
//        locationManager.startUpdatingLocation()
//    }
    
}

