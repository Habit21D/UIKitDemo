//
//  DMImageViewController.swift
//  UIKitDemo
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 lazywe. All rights reserved.
//

import UIKit

class DMImageViewController: DMRootViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        creatNormalImageView()
        
        //添加动画视图
        creatAnimationImages()
    }
    
    func creatNormalImageView()  {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 10, y: 80, width: ScreenWidth - 20, height: 150)
        imageView.backgroundColor = UIColor.cyan
        //图片的截切模式
        imageView.contentMode = .scaleAspectFit
        
        //使用本方法加载，会对图片进行缓存，下次取图片会优先从缓存查找，没有的话再查找资源
        //Assets.xcassets 只能使用此方式加载，Assets.xcassets只支持只支持png / jpeg，不支持诸如gif等其他图片格式
        //  1⃣️
        //imageView.image = UIImage(named: "Demo_image")
        
        //加载的具体分析可以参考 http://www.jianshu.com/p/5358f587af38 这篇博客
        //2⃣️ 二进制加载 不带缓存的加载  适合图片不需要反复读取，占用内存较大的图片
        //        let imageURL = Bundle.main.path(forResource: "Image1.png", ofType: nil)
        //        let tempData = try? Data(contentsOf: URL(fileURLWithPath: imageURL!))
        //        if let date = tempData {
        //            imageView.image = UIImage(data: date)
        //
        //        }
        
        // 3⃣️ 资源路径加载 不带缓存的加载  适合图片不需要反复读取，占用内存较大的图片
        let imageURL2 = Bundle.main.path(forResource: "Image1.png", ofType: nil)
        if let url = imageURL2 {
            imageView.image = UIImage(contentsOfFile: url)
            
        }
        
        self.view.addSubview(imageView)
    }
    
    func creatAnimationImages(){
        var imageArr : [UIImage] = []
        var i = 1
        while i < 11 {
            let image = UIImage(named: "tiantiansifangmao-0\(i)")
            if let tempImage = image {
                imageArr.append(tempImage)
            }
            i += 1
        }
        
        let animationImageView = UIImageView(frame: CGRect(x: 50, y:270, width: Int(ScreenWidth - 100), height: 100))
        self.view.addSubview(animationImageView)
        animationImageView.contentMode = .scaleAspectFit
        //要用来做动画的图片数组
        animationImageView.animationImages = imageArr
        //一次轮播的时常
        animationImageView.animationDuration = 6
        //轮播次数 0为无限轮播
        animationImageView.animationRepeatCount = 0
        //开始轮播
        animationImageView.startAnimating()
        //停止轮播
//        animationImageView.stopAnimating()

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
