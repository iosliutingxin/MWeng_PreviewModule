//
//  PreviewCell.swift
//  Pods
//
//  Created by 李孔文 on 2018/9/3.
//

import UIKit

class PreviewCell: UITableViewCell {

    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var previewTitle: UILabel!
    @IBOutlet weak var previewDate: UILabel!
    
    var model : previewModel?{
        didSet{
            
            guard model != nil else {return}
            previewTitle.text = model?.fileName
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
