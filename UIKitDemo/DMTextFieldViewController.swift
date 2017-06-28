//
//  DMTextFieldViewController.swift
//  UIKitDemo
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 lazywe. All rights reserved.
//

import UIKit

class DMTextFieldViewController: DMRootViewController,UITextFieldDelegate {

    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(textField)
        // Do any additional setup after loading the view.
        textField.frame = CGRect(x: 20, y: 100, width: ScreenWidth - 40, height: 60)
        
        //textField的边框样式
        textField.borderStyle = .roundedRect
        
        //背景色
        textField.backgroundColor = UIColor.cyan
        
        //输入的文字颜色
        textField.textColor = UIColor.red
        
        //占位符，也可以设置attributedPlaceholder 富文本形式的占位符
        textField.placeholder = "请在这里输入文字"
        
        //字体大小
        textField.font = UIFont.systemFont(ofSize: 18)
        
        //对齐方式
        textField.textAlignment = .left
        
        //输入框右边的清楚内容按钮什么时候显示，这里设置成编辑时显示
        textField.clearButtonMode = .whileEditing
        
        //进入编辑状态时是否清空原始内容
//        textField.clearsOnBeginEditing = true
        
        //文字根据宽度变化大小
        textField.adjustsFontSizeToFitWidth = true
        
        //adjustsFontSizeToFitWidth = true时 最小要显示的字体
        textField.minimumFontSize = 15
        
        //键盘的样式
        textField.keyboardType = .emailAddress
        
        //键盘上return键的样式
        textField.returnKeyType = .done
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        leftView.backgroundColor = UIColor.red
        //设置左边的视图
        textField.leftView = leftView
        //设置左视图的展示时间  不设置时不展示
        textField.leftViewMode = .always
        
        //右视图同左视图
        textField.rightView = {
            let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            rightView.backgroundColor = UIColor.red
            return rightView
        }()
        textField.rightViewMode = .always
        
        //设置代理
        textField.delegate = self
        
    }

    //触发首饰时执行，可用于点击空白处收起键盘。
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)

    }
    
    //将要开始编辑
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    //开始编辑
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    //文本发生改变时调用
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    //将要结束编辑
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    //结束编辑
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
  
    //textField 点击return时调用
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //某个输入框收起键盘
//        textField.resignFirstResponder()
        
        //整个视图结束编辑，收起键盘
//        self.view.endEditing(true)
        
        //整个app结束编辑，收起键盘
        UIApplication.shared.keyWindow?.endEditing(true)
        
        return true
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
