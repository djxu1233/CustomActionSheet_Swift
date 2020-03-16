//
//  DeviceConst.swift
//  DJCustomActionSheet_Swift
//
//  Created by minstone.DJ on 2020/3/16.
//  Copyright © 2020 minstone. All rights reserved.
//

import UIKit

let kScreenBounds = UIScreen.main.bounds
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

/**
 机型的屏幕大小
 */

let Device_Is_iPhoneX=__CGSizeEqualToSize(CGSize.init(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)
 
let Device_Is_iPhoneXr=__CGSizeEqualToSize(CGSize.init(width: 828/2, height: 1792/2), UIScreen.main.bounds.size)
 
let Device_Is_iPhoneXs=__CGSizeEqualToSize(CGSize.init(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)
 
let Device_Is_iPhoneXs_Max=__CGSizeEqualToSize(CGSize.init(width: 1242/3, height: 2688/3), UIScreen.main.bounds.size)

let Device_Is_iPhone11=__CGSizeEqualToSize(CGSize.init(width: 828/2, height: 1792/2), UIScreen.main.bounds.size)

let Device_Is_iPhone11Pro=__CGSizeEqualToSize(CGSize.init(width: 1125/3, height: 2436/3), UIScreen.main.bounds.size)

let Device_Is_iPhone11Pro_Max = __CGSizeEqualToSize(CGSize.init(width: 1242/3, height: 2688/3), UIScreen.main.bounds.size)

 
let isIphoneX = (Device_Is_iPhoneX || Device_Is_iPhoneXr || Device_Is_iPhoneXs || Device_Is_iPhoneXs_Max || Device_Is_iPhone11 || Device_Is_iPhone11Pro || Device_Is_iPhone11Pro_Max)
 
/**
状态栏高度
 */
let StateBarHigh = ((Device_Is_iPhoneX||Device_Is_iPhoneXr||Device_Is_iPhoneXs||Device_Is_iPhoneXs_Max || Device_Is_iPhone11 || Device_Is_iPhone11Pro || Device_Is_iPhone11Pro_Max) ? 44:20)
/**
 顶部状态栏+导航高度
 */
let TopSpaceHigh = ((Device_Is_iPhoneX||Device_Is_iPhoneXr||Device_Is_iPhoneXs||Device_Is_iPhoneXs_Max || Device_Is_iPhone11 || Device_Is_iPhone11Pro || Device_Is_iPhone11Pro_Max) ? 88:64)
/**
 底部安全区域的高度
 */
let  bottomSafeHeight = ((Device_Is_iPhoneX||Device_Is_iPhoneXr||Device_Is_iPhoneXs||Device_Is_iPhoneXs_Max || Device_Is_iPhone11 || Device_Is_iPhone11Pro || Device_Is_iPhone11Pro_Max) ? 34:0)


