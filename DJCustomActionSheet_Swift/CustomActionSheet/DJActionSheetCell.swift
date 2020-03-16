//
//  DJActionSheetCell.swift
//  DJCustomActionSheet_Swift
//
//  Created by minstone.DJ on 2020/3/16.
//  Copyright © 2020 minstone. All rights reserved.
//

import UIKit

class DJActionSheetCell: UITableViewCell {
    
    var model: DJActionSheetModel? = nil
    
    let textLab = UILabel()
    let checkImgV = UIImageView()
    
    let lineV = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configUI() {
        
        textLab.frame = CGRect.init(x: 10, y: 0, width: kScreenWidth - 20, height: cellHeight)
        textLab.font = UIFont.systemFont(ofSize: 14)
        textLab.textAlignment = .left
        textLab.textColor = .black
        textLab.numberOfLines = 2
        self.contentView.addSubview(textLab)
        
        //打勾☑️
        checkImgV.frame = CGRect.init(x: kScreenWidth - 10 - 28, y: 0, width: 28, height: 28)
        checkImgV.center.y = self.contentView.center.y
        checkImgV.image = UIImage.init(named: "tick_icon")
        checkImgV.isHidden = true
        self.contentView.addSubview(checkImgV)
        
        lineV.frame = CGRect.init()
        lineV.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        self.contentView.addSubview(lineV)
    }
    
    //配置model
    func configModel(_ model: DJActionSheetModel) {
        
        self.model = model
        
        textLab.text = model.itemText as String?
        
        textLab.textColor = model.textColor
        textLab.font = model.textFont
        textLab.textAlignment = model.textAlign

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.model?.type == DJActionSheetType.typeCheck {
            checkImgV.center.y = self.contentView.center.y
            checkImgV.isHidden = self.model?.isSelected == true ? false : true
        }
                
        let labelMarginToRight: CGFloat = self.model?.type == DJActionSheetType.typeCheck ? (10 + 28 + 10) : 10

        textLab.frame = CGRect.init(x: 10, y: 0, width: kScreenWidth - 10 - labelMarginToRight, height: cellHeight)
        
        lineV.frame = CGRect.init(x: 15, y: self.frame.size.height - 0.5, width: kScreenWidth - 10, height: 0.5)
    }

}
