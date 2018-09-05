//
//  AppDelegate.swift
//  MWeng_PreviewModule
//
//  Created by 1778714848@qq.com on 08/28/2018.
//  Copyright (c) 2018 1778714848@qq.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // 创建Window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // 设置Window的背景颜色
        self.window?.backgroundColor = UIColor.white
        // 设置根控制器
        let controller = ViewController()
        let navigation = UINavigationController.init(rootViewController: controller)

        self.window?.rootViewController = navigation
        // 设置并显示主窗口
        self.window?.makeKeyAndVisible()
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //文档预览功能
        let notificationName = "previewNotification"
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName), object: url)
        return true
    }




}

