//
//  MyTableViewCell.swift
//  AutoLayoutDemo
//
//  Created by Gavin on 16/4/3.
//  Copyright © 2016年 Gavin. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var customImage: UIImageView!
    @IBOutlet weak var customTitle: UILabel!
    @IBOutlet weak var customDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //设置cell是有圆角的
        customView.layer.cornerRadius = 8
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
