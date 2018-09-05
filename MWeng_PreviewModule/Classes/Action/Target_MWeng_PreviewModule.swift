//
//  Target_MWeng_PreviewModule.swift
//  Pods
//
//  Created by 李孔文 on 2018/8/31.
//

import UIKit

class Target_MWeng_PreviewModule: NSObject {
    //首页
    func Action_pushToHomeVC(dic : NSDictionary) -> UIViewController {
        
        let preview  = PreviewListController()
        return preview
    }
}
