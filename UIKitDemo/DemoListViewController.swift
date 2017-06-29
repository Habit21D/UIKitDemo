//
//  DemoListViewController.swift
//  UIKitDemo
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 lazywe. All rights reserved.
//  列表页。展示不同UI的选择器

import UIKit

enum ListType : String {
    case UIView = "UIView"
    case UILabel = "UILabel"
    case UIButton = "UIButton"
    case UIImageView = "UIImageView"
    case UITextField = "UITextField"
}

class DemoListViewController: DMRootViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    lazy var tableView: UITableView = {
        let tempTableview = UITableView(frame: self.view.frame, style: .plain)
        return tempTableview
    }()
    
    lazy var dataArray: Array = { () -> [ListType] in
        let tempArray = [ListType.UIView,ListType.UILabel,ListType.UIButton,ListType.UIImageView,ListType.UITextField];
        
        return tempArray;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "UIKit列表"
    
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row].rawValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //点击方法
        tableView.deselectRow(at: indexPath, animated: true)
        let listType = self.dataArray[indexPath.row]
        var vc : UIViewController
        switch listType {
        case .UIView:
            vc = DMViewViewController()
        case .UILabel:
            vc = DMLabelViewController()
            break
        case .UIButton:
            vc = DMButtonViewController()
            break
        case .UITextField:
            vc = DMTextFieldViewController()
            break
        case .UIImageView:
            vc = DMImageViewController()
            break
         //....
        }
        
        vc.title = listType.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
