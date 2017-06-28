//
//  DMLabelViewController.swift
//  UIKitDemo
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 lazywe. All rights reserved.
//

import UIKit

class DMLabelViewController: DMRootViewController {
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //UILabel继承自UIView，基础设置和UIView是一样的，不再累述
        label.frame = CGRect(x: 20, y: 100, width: ScreenWidth - 40, height: 60)
        label.backgroundColor = UIColor.cyan
        
        //设置文本
        label.text = "这里是Label，也就是显示文字的视图.这里只展示常用的属性吧"
        
        //设置字体
        label.font = UIFont.systemFont(ofSize: 18)
        
        //设置字体颜色
        label.textColor = UIColor.magenta
        
        //文本的对其方式：默认左对齐
        label.textAlignment = .center
        
        //是否缩放字体
//        label.adjustsFontSizeToFitWidth = true
        
        //是否换行显示 默认是1行， 设置为0代表行数由文本自行决定
//        label.numberOfLines = 0
        
//        文字过多时，截断多方式，基本用的是...出现的位置
        label.lineBreakMode = .byTruncatingMiddle

        //设置文本的阴影颜色
        label.shadowColor = UIColor.black
        
        //阴影的偏移量
        label.shadowOffset = CGSize(width: 2, height: 2)
        
        self.view.addSubview(label)
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
