//
//  MarkDownViewController.swift
//  AppFrameworkCollection
//
//  Created by DingYD on 2019/5/16.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import UIKit

class MarkDownViewController: UIViewController {

    public var json = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "markdown";
        
        
        //        print(JsonFormatUtil.stringToJSON(strJson: json))
        print(self.getDictionaryFromJSONString(jsonString: json))
        // Do any additional setup after loading the view.
        let mdView = MarkdownView()
        view.addSubview(mdView)
        mdView.translatesAutoresizingMaskIntoConstraints = false
        mdView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mdView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        



        mdView.load(markdown: json, enableImage: true)
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
        
    }

}
