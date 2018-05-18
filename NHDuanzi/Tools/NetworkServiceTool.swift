//
//  NetworkServiceTool.swift
//  NHDuanzi
//
//  Created by yuchanglin on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit
import Alamofire

enum RequestMethod :Int {
    case GET = 1
    case POST = 2
    
}

class NetworkServiceTool: NSObject {
    private override init() {}
    static let share : NetworkServiceTool = NetworkServiceTool()
}
extension NetworkServiceTool {
    
    func requestData(_ url:String,
                    methodType:RequestMethod,
                    params:[String:AnyObject]? = nil,
                    headers:[HTTPHeaders]? = nil,
                    success:@escaping(_ response:AnyObject)->(),
                    failure:@escaping(_ error:Error)->()) -> Void {
        
        // 请求头
        let header = requestHeader(headers)
        // 方法
        let method = requestMethod(methodType)
        
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            
            switch response.result {
            case .success:
                print("请求成功")
                success(response.result.value as AnyObject)
            case .failure:
                print("请求失败")
                failure(response.error!)
            }
        }
    }
    
    private func requestHeader(_ headers:Any? = nil) -> HTTPHeaders {
        if headers == nil {
            return ["Accept":"application/json"]
        }else{
            return headers as! HTTPHeaders
        }
    }
    
    
    private func requestMethod(_ method:RequestMethod) -> HTTPMethod {
        if method == .GET {
            return .get
        }else{
            return .post
        }
    }
}
