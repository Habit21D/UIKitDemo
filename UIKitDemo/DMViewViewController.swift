//
//  DMViewViewController.swift
//  UIKitDemo
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 lazywe. All rights reserved.
//

import UIKit

class DMViewViewController: DMRootViewController {

    //swift中变量必须在类init前初始化
    let redView = UIView()
    let cyanView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        redViewSetting()//1⃣️.先进入函数内学习 常用的属性 设置
        redViewLayerSetting()//2⃣️.进入方法内学习 layer相关的设置
        cyanViewSetting()
        
        self.view.addSubview(redView)
        self.view.addSubview(cyanView)
        viewMove()// 3⃣️.学习下面的图层相关
     }

    //1⃣️UIView的常用属性设置
    func redViewSetting() {
        //swift的代码提示：在输入CGRect之后输入（ 会自动提示初始化方法
        //* view的位置设置（有frame,bounds,center三个属性）
        redView.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        
        //* view的背景色设置
        redView.backgroundColor = UIColor.red
        
        //* 设置Tag值，tag值就是对view编辑一个数字，通过数字能够取到view,或区分view
        redView.tag = 1000
        //Tag值取view
//        self.view.viewWithTag(1000)
        
        //* 是否支持用户手势，默认为flase
        redView.isUserInteractionEnabled = true
        
        //* 手势
        let tapRedView = UITapGestureRecognizer(target: self, action: #selector(tapRedViewAction))
        redView.addGestureRecognizer(tapRedView)
        
    }
    
    //2⃣️CALayer层的设置
    func redViewLayerSetting(){
        //* 设置圆角 设置圆角一般配合masksToBounds使用，当你设置的圆角没有出现时，试试加上masksToBounds的设置
        redView.layer.cornerRadius = 10
        //        redView.layer.masksToBounds = true
        //        redView.clipsToBounds = true
        
        //* 阴影
        redView.layer.shadowColor = UIColor.blue.cgColor// 阴影的颜色
        redView.layer.shadowOpacity = 0.7// 阴影透明度 必须设置，因为默认是0 即全透明
        redView.layer.shadowOffset = CGSize(width: 5, height: 5)//阴影相对于view的偏移量
        redView.layer.shadowRadius = 10// 阴影扩散的范围
        
        //* 边框
        redView.layer.borderColor = UIColor.green.cgColor
        redView.layer.borderWidth = 2
    }
    
    //手势的点击方法
    func tapRedViewAction(sender: UITapGestureRecognizer){
        let tempView = sender.view
        //* UIView的动画
        UIView.animate(withDuration: 0.5, animations: {
            //仿射变换，用于在二维空间做旋转，缩放和平移
            tempView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { complete in
            UIView.animate(withDuration: 0.5, animations: { 
                tempView?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        tempView?.backgroundColor = UIColor(red:rand(), green: rand(), blue: rand(), alpha: 1.0)
    }
    
    //获取随机数
    func rand() -> CGFloat{
        return CGFloat(arc4random()%255)/255.0
    }
    
    func  cyanViewSetting()  {
        cyanView.backgroundColor = UIColor.cyan
        cyanView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)//view的边界大小，即宽和高的设置
        cyanView.center = redView.center//view的中心点位置设置
        
    }
    
    //3⃣️视图的图层层级
    func viewMove()
    {
        //view的显示顺序和添加顺序有关，后添加的图层在先添加的上面，此时cyanView是压在redView上面的
        //        self.view.bringSubview(toFront: redView)//把redView图层移到最前面
        //        self.view.insertSubview(cyanView, belowSubview: redView)//把cyanView插入到redView下面
        self.view.sendSubview(toBack: cyanView)//把cyanView放到最后
        
        //        cyanView.removeFromSuperview()//cyanView从父view上移除
        
        //        var subViews = self.view.subviews//获取view到所有子试图（添加到view上的视图为子试图）
        
        //        cyanView.superview //cyanView所添加到的视图，也就是父视图

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
