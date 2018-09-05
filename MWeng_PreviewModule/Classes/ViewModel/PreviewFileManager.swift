//
//  PreviewFileManager.swift
//  Pods
//
//  Created by 李孔文 on 2018/9/3.
//

import UIKit

class PreviewFileManager: NSObject {

    //单利
    static let instance = PreviewFileManager()
    
    //获取文件列表
    func getFileListInFolder() -> Array<Any> {
        //数据数组
        var DataArr = Array<Any>()
        let directory = getInboxPath()
        let fileManager = FileManager.default
        let paths = fileManager.subpaths(atPath: directory)

        guard (paths?.count) != nil else {
            return DataArr
        }
        //遍历封装
        for  fileName in paths! {
            //拼接文件名称
            let fileUrl = directory + fileName
            do{
                let fileInfo = try fileManager.attributesOfItem(atPath: fileUrl)
                let model = previewModel.init()
                model.fileName = fileName
                model.fileExtension = NSString(string: fileName).pathExtension
                model.fileFullPath = fileUrl
                model.fileProperty = fileInfo as NSDictionary

                //封装好的模型放到数组中
                DataArr.append(model)
            }catch{
                print("error")
            }
            
        }
        
        return DataArr
    }
    
    func deleteFileWithPath(path : String) {
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(atPath: path)

      
    }
    

    // 获取/Documents/Inbox路径
    func getInboxPath() -> String {
        
        let filePaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        return filePaths!+"/Inbox/"
    }


}
