//
//  DJActionSheetModel.swift
//  DJCustomActionSheet_Swift
//
//  Created by minstone.DJ on 2020/3/16.
//  Copyright © 2020 minstone. All rights reserved.
//

import UIKit

enum DJActionSheetType {
    case typeDefault    //默认类型
    case typeCheck      //带选中的打勾check☑️
}

class DJActionSheetModel: NSObject {
    
    
    var itemText: NSString?
    var isSelected: Bool?
    
    //设置默认值
    var type = DJActionSheetType.typeDefault
    
    var textColor: UIColor = .black
    var textAlign: NSTextAlignment = .left
    var textFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    override init() {
        super.init()
    }


}
