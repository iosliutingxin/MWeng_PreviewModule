//
//  PreviewContent.swift
//  Pods
//
//  Created by 李孔文 on 2018/9/4.
//

import UIKit
import QuickLook

public class PreviewContent: NSObject,QLPreviewControllerDataSource,QLPreviewControllerDelegate {
    
    fileprivate lazy var previewContents : [Any] = [Any]()
    //单利
    public static let instance = PreviewContent()
    
    public func NofifacationInit()  {
        //注册通知用于预览其他APP分享的文档
        let notificationName = "previewNotification"
        NotificationCenter.default.addObserver(self, selector: #selector(notificationAction), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }

    //通知监听方法
    @objc func notificationAction(message : Notification)  {
        
        let NotificationMessage = message.object
        previewContents.removeAll()
        previewContents.append(NotificationMessage!)
        quickLookFileAtIndex(indes: 0)
        
    }
    
    
    func quickLookFileAtIndex(indes : NSInteger)  {
        
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
        //      previewController.currentPreviewItemIndex = indes
        getCurrentVC()?.present(previewController, animated: false, completion: nil)
    }
    
    public func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return  previewContents.count
    }
    
    public func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        let urlString = "hangge://article/C"
        var url = URL(string: urlString)
        if  previewContents.first is String {
            url = URL(fileURLWithPath: previewContents.first! as! String)
        }else{
            url = (previewContents.first as! URL)
        }
        return url! as QLPreviewItem
        
    }
    
    func getCurrentVC() -> UIViewController? {
        for window in UIApplication.shared.windows.reversed() {
            var tempView: UIView? = window.subviews.last
            for subview in window.subviews.reversed() {
                if subview.classForCoder == NSClassFromString("UILayoutContainerView") {
                    tempView = subview
                    break
                }
            }
            
            var nextResponder = tempView?.next
            
            var next: Bool {
                return !(nextResponder is UIViewController) || nextResponder is UINavigationController || nextResponder is UITabBarController || nextResponder?.classForCoder == NSClassFromString("UIInputWindowController")
            }
            
            while next{
                tempView = tempView?.subviews.first
                if tempView == nil {
                    return nil
                }
                nextResponder = tempView!.next
            }
            if let currentVC = nextResponder as? UIViewController {
                return currentVC
            }
        }
        return nil
    }
}
