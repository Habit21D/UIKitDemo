
//
//  DMButtonViewController.swift
//  UIKitDemo
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 lazywe. All rights reserved.
//

import UIKit

class DMButtonViewController: DMRootViewController {
    
    let btn = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(btn)
        // Do any additional setup after loading the view.
        btn.frame = CGRect(x: 40, y: 200, width: 200, height: 100)
        
        //背景色，不同于下面的文本等可以区分状态设置
       // btn.backgroundColor = UIColor.blue
        
        //文本设置  按钮的文本，颜色，图片等的设置都是区分不同的按钮状态的
        btn.setTitle("未选中", for: .normal)//正常状态
        btn.setTitle("高亮", for: .highlighted)//高亮状态，即手指点击不移开
        btn.setTitle("选中状态", for: .selected)//选中状态
        
        //设置图片
        btn.setImage(UIImage(named:"Demo_happy"), for: .normal)
        
        //设置背景图
        btn.setBackgroundImage(UIImage(named:"Demo_bg"), for: .normal)
        
        //默认按钮的图片在左，文字在右，可以通过调整edgeInset来改变它们的位置
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, -30, 0)
        btn.imageEdgeInsets = UIEdgeInsetsMake(-20, 50, 0, 0)

        //设置圆角
        btn.layer.cornerRadius = 10//只设置圆角是不行的
        btn.layer.masksToBounds = true
        
        //按钮文字+图片的 横向对齐方式  默认居中
//        btn.contentHorizontalAlignment = .left
        //按钮文字+图片的 竖直方向对齐方式  默认居中
//        btn.contentVerticalAlignment = .bottom
        
        //按钮当前的标题 只读属性
        print(btn.currentTitle ?? "按钮没有文字")
       
        //按钮当前的图片 只读
        print(btn.currentImage ?? "无图")
        
        //添加点击事件 #selector()中为点击时要执行的函数名  touchUpInside为出发点击事件的手势事件，是个枚举
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
    }

    func clickBtn(sender:UIButton) {
        //弹簧动画
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .layoutSubviews, animations: {
            sender.transform = CGAffineTransform(translationX: 10, y: 0)
        }) { (complete) in
            sender.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        
        //转场动画
        UIView.transition(with: sender, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
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
