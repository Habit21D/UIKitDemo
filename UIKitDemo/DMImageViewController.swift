//
//  DMImageViewController.swift
//  UIKitDemo
//
//  Created by apple on 2017/6/28.
//  Copyright © 2017年 lazywe. All rights reserved.
//

import UIKit

class DMImageViewController: DMRootViewController {

    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        // Do any additional setup after loading the view.
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
