//
//  ViewController.swift
//  521Travel_TableViewGroup
//
//  Created by youngstar on 16/11/2.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    var tableView:UITableView!
    var allNames:Dictionary<Int, [String]>!
    var addHeaders:[String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   allNames =
    [
        0:[String](["UILabel 标签", "UITextField 文本框", "UIButton 按钮"]),
        1:[String](["UIDatePiker 日期选择器", "TableView 表格视图", "UIToolbar 工具条", "UIWebView 浏览器"])
        ]
    
        print(allNames)
        
        addHeaders = ["常见 UIKit 控件","高级 UIKit 控件"]
        // 创建表格
        tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
        
        // 注册cell
        tableView .register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 创建表头标签
        let headerLabel = UILabel.init(frame: CGRect(x:0, y:20, width:375, height:30))
        headerLabel.backgroundColor = UIColor.yellow
        headerLabel.textColor = UIColor.red
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.text = "高级 UIKit"
        headerLabel.textAlignment = NSTextAlignment.center
        headerLabel.font = UIFont.systemFont(ofSize: 15)
        tableView.tableHeaderView = headerLabel
    
    }
    
    // 创建分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return allNames.count
    }
    
    // 每个分区的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNames[section]!.count
        
    }
    
    // 分区头部显示
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return addHeaders[section]
    }

    // 分区尾部显示
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let data = allNames[section]
        return "有\(data!.count)个控件"
    }
    
    // 显示cell内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify = "cell"
        
        let secno = indexPath.section
        let data = allNames[secno]
        
        if secno == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = data?[indexPath.row]
            
            cell.imageView?.image = UIImage(named:"bug")
            
            return cell
        }
        else
        {
            let adCell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: identify)
            adCell.textLabel?.text = data?[indexPath.row]
            adCell.detailTextLabel?.text = "\(data![indexPath.row])的详解"
            
              return adCell
        }
        
      
    }
    
    // cell的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // 确定该分组的内容
        let str = allNames[indexPath.section]?[indexPath.row]
        print("str\(str)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

