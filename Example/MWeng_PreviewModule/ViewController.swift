//
//  ViewController.swift
//  MWeng_PreviewModule
//
//  Created by 1778714848@qq.com on 08/28/2018.
//  Copyright (c) 2018 1778714848@qq.com. All rights reserved.
//

import UIKit
import MWeng_PreviewModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = PreviewListController()
        //        self.present(vc, animated: false, completion: nil)
        self.navigationController?.pushViewController(vc, animated: false)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        let vc = PreviewListController()
//        self.present(vc, animated: false, completion: nil)
        self.navigationController?.pushViewController(vc, animated: false)
    }

}

