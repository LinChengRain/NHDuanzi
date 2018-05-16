//
//  ServiceManager.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit
import Alamofire

/// 请求响应状态
///
/// - success: 响应成功  - 就是成功
/// - unusual: 响应异常  - 例如 手机已被注册
/// - notLogin: 未登录   - 例如 token到期
/// - failure: 请求错误  - 例如 比如网络错误
enum MHResponseStatus:Int {
    case success = 0
    case unusual  = 1
    case notLogin = 2
    case failure  = 3
}
enum MHRequestType:Int {
    case post
    case get
}
class ServiceManager: NSObject {
    static let shareNetworkTool = ServiceManager()
    fileprivate var sessionManager: SessionManager!
}


extension ServiceManager{
    
    func requestData(_ url:String,
                     _ methods:HTTPMethod,
                     _ params:[String:AnyObject],
                     success:@escaping(AnyObject)->(),
                     failture:@escaping(Error)->()) -> Void {
        
        // 请求头
       let headers = requestHeader()
//        Alamofire.request(url, method:requestMethod(methodType), parameters: params, encoding: ParameterEncoding.encode(UTF8), headers: headers)
//        Alamofire.request(url, method: HTTPMethod.post, parameters: params, encoding: ParameterEncoding.encode(UTF8), headers: headers).responseJSON { (response) in
//
//        }
    }
    
    func requestHeader() -> HTTPHeaders {
        let headers :HTTPHeaders = [
            "Accept": "application/json"
        ]
        return headers
    }
    

}
