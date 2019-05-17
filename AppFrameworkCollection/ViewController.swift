//
//  ViewController.swift
//  AppFrameworkCollection
//
//  Created by DingYD on 2019/5/11.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var tabArray:Array<String> {
        return ["MarkDown"]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.backgroundColor =
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.openUrlFilesName(noti:)), name: NSNotification.Name(rawValue: "OPenUrlFilesName"), object: nil)
    }
    @objc func openUrlFilesName(noti:Notification) {
        if let dict = noti.userInfo{
            let url = dict["url"] as! URL
            let data = try? Data.init(contentsOf: url)
            self.determineType(type: url.absoluteString.components(separatedBy: ".").last ?? "", data: data)
        }
    }
    
    /// 判断文件类型,跳转对应控制器
    ///
    /// - Returns: return value description
    private func determineType(type:String,data:Data?) {
            let vc = MarkDownViewController()
            var str = "## 抱歉文件打不开"
            if let data = data {
                str = String.init(data: data, encoding: String.Encoding.utf8) ?? "## 抱歉文件打不开"
            }
            vc.json = str
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tabArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = self.tabArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(MarkDownViewController(), animated: true)
        default:
            break
        }
    }
}

