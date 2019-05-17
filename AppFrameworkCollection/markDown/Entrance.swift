//
//  Entrance.swift
//  AppFrameworkCollection
//
//  Created by DingYD on 2019/5/11.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

enum Movement: String {
    case info = "常规信息"
    case error = "错误信息"
    case warning = "警告信息"
    case http = "网络请求信息"
    case other = "其他信息"
}
enum Http_Request_Method:String {
    case Post = "Post请求"
    case Get = "Get请求"
}
/// 网络请求的打印参数
struct HttpPrintParameterData {
    /// 请求的参数
    var requestUrl:String = ""
    /// 请求的参数
    var requestParameter:Data?
    /// 请求的头部信息
    var requestHeader:Data?
    /// 请求的类型
    var requestMethod:Http_Request_Method?
    /// 接口是否成功响应
    var responseState:Bool = false
    /// 接口响应失败的错误
    var responseError:Error?
    /// 接口响应时间 单位毫秒
    var responseTime:Int?
    /// 接口响应参数
    var responseData:Data?
    
    func getJson(_ data:Data) -> Any? {
        let dict = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        if dict != nil {
            return dict
        }
        return nil
    }
}


func printHttp(_ data:HttpPrintParameterData) {
    
}


public func printDebug( _ object: @autoclosure() -> Any?,
                    _ file: String = #file,
                    _ function: String = #function,
                    _ line: Int = #line) {
    #if DEBUG
    guard let value = object() else {
        return
    }
    var stringRepresentation: String?
    
    if let value = value as? CustomDebugStringConvertible {
        stringRepresentation = value.debugDescription
    }
    else if let value = value as? CustomStringConvertible {
        stringRepresentation = value.description
    }
    else {
        fatalError("gLog only works for values that conform to CustomDebugStringConvertible or CustomStringConvertible")
    }
    
    let gFormatter = DateFormatter()
    gFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = gFormatter.string(from: Date())
    let queue = Thread.isMainThread ? "主线程" : "子线程"
    let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
    print("")
    print("----------------------------------------")
    print("当前时间 \(timestamp)")
    print("当前线程 \(queue)")
    print("所在文件 \(fileURL)")
    print("所在行数 \(line)")
    print("方法名称 \(function)")
    if let string = stringRepresentation {
        print("打印内容: \(string)")
    } else {
        print("打印内容: \(value)")
    }
    print("----------------------------------------")
    print("")
    #endif
}
