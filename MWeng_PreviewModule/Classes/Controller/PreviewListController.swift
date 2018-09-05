//
//  PreviewListController.swift
//  Pods
//
//  Created by 李孔文 on 2018/8/30.
//

import UIKit
import UZMeidator
import QuickLook
private let cellID = "PreviewCellID"

public class PreviewListController: UIViewController {
//------------------------------声明开始--------------------------------------------
    //数据源
    fileprivate lazy var previewModels : [previewModel] = [previewModel]()
    fileprivate lazy var previewContents : [Any] = [Any]()

    //UITableView
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.white
        tableView.backgroundColor = UIColor.white
        tableView.register(UINib(nibName: "PreviewCell", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: cellID)
        return tableView
        
        }()
    
//-------------------------------开始--------------------------------------------

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.addSubview(tableView)
        getDate()
        
        //注册通知用于预览其他APP分享的文档
        let notificationName = "previewNotification"
        NotificationCenter.default.addObserver(self, selector: #selector(notificationAction), name: NSNotification.Name(rawValue: notificationName), object: nil)

    }
    public override func viewWillAppear(_ animated: Bool) {
        getDate()
    }
    
    /// 析构函数.类似于OC的 dealloc
    deinit {
        /// 移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
}

//------------------------------设置UITableView---------------------------------------------

extension PreviewListController : UITableViewDataSource ,UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previewModels.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:cellID , for: indexPath) as! PreviewCell
        cell.previewTitle.text = previewModels[indexPath.row].fileName
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        cell.previewDate.text = dformatter.string(from: previewModels[0].fileProperty?.value(forKey: FileAttributeKey.creationDate.rawValue) as! Date)
        //获取符号扩展名
        let fileextension = previewModels[indexPath.row].fileExtension
        if fileextension == "doc" ||  fileextension == "docx" {
            cell.previewImage.image = UIImage(named: "word", in: Bundle(for: self.classForCoder), compatibleWith: nil)
        }else if fileextension == "ppt" || fileextension == "pptx"{
            cell.previewImage.image = UIImage(named: "ppt", in: Bundle(for: self.classForCoder), compatibleWith: nil)
        }else if fileextension == "xlsx" || fileextension == "xls"{
            cell.previewImage.image = UIImage(named: "excel", in: Bundle(for: self.classForCoder), compatibleWith: nil)
        }else if fileextension == "pdf" {
            cell.previewImage.image = UIImage(named: "pdf", in: Bundle(for: self.classForCoder), compatibleWith: nil)
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        previewContents.removeAll()
        previewContents.append(previewModels[indexPath.row].fileFullPath as NSString)
        quickLookFileAtIndex(indes: indexPath.row)

    }
    
    //删除操作
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "delete") { (action : UITableViewRowAction, indexPath :IndexPath) in
            
            let manager =  PreviewFileManager.instance
            manager.deleteFileWithPath(path: (self.previewModels[indexPath.row].fileFullPath as String))
            self.getDate()
        }
        
        return [deleteAction]
    }
}

//------------------------------方法设置开始--------------------------------------------
extension PreviewListController{
    
    //控制器跳转
    @objc func ToPersonCenterVC()  {
        
        let vc =   UZMediatorManager.sharedInstance().uzMediator_HomeVC(withParams: ["测试" : "code01"], withMessage: nil)
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    //获取数据
    func getDate() {
        
        let manager =  PreviewFileManager.instance
        previewModels =  manager.getFileListInFolder() as! [previewModel]
        self.tableView.reloadData()
        
    }
    //通知监听方法
   @objc func notificationAction(message : Notification)  {
    
    let NotificationMessage = message.object
    previewContents.removeAll()
    previewContents.append(NotificationMessage!)
    quickLookFileAtIndex(indes: 0)
    
    }
    
}
//---------------------------设置QLPreviewController-------------------------------------------
extension PreviewListController : QLPreviewControllerDelegate,QLPreviewControllerDataSource {

    func quickLookFileAtIndex(indes : NSInteger)  {
        
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
//      previewController.currentPreviewItemIndex = indes
        self.present(previewController, animated: false, completion: nil)
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
    
}
