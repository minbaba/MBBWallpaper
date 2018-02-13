//
//  HttpErrorCode.swift
//  MBBWallpaper
//
//  Created by minbaba on 2017/10/16.
//  Copyright © 2017年 minbaba Inc. All rights reserved.
//

import HandyJSON

enum HttpErrorCode: Int, HandyJSONEnum {

    case notFound = 404
    case Success = 1000                 ///< 请求成功
    case RequestFailed = 40000          ///< 请求失败
    case InvalidToken = 40002           ///< 登陆已失效
    case InvalidLogin = 40003           ///< 账号在其它设备登陆
    case WorkOrderComplete = 40004      ///< 工单已完成
    case WorkOrderUndefined = 40005     ///< 工单不存在
    case OrderUndefined = 40006         ///< 订单不存在
    case IncompleteWorkOrder = 40007    ///< 有未完成工单
    case CarInDispatching = 40008       ///< 车辆已被调度
}

