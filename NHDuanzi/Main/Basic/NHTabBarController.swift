//
//  NHTabBarController.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

class NHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addContollers()
    }
    
    private func addContollers() {
        // 最热
        let hot = NHHotViewController()
        addController(hot, "最热", "zuire", "zuire_s")
        // 最新
        let new = NHNewViewController()
        addController(new, "最新", "zuixin", "zuixin_s")
        // 更多
        let more = NHMoreViewController()
        addController(more, "更多", "more", "more_s")
    }
    
    private func addController(_ controller : UIViewController,
                               _ title : String,
                               _ imageStr : String,
                               _ selectedImageStr : String) {
        // 1.标题
        controller.title = title;
        // 2.图片设置
        let image = UIImage(named: imageStr)
        let selectImage = UIImage(named: selectedImageStr)
        controller.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = selectImage?.withRenderingMode(.alwaysOriginal)
        tabBar.tintColor = RGBColor(71,61,72,1)
        // 3.添加到导航控制器
        let navigationVC = NHNavigationController(rootViewController: controller)
        addChildViewController(navigationVC)
        
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
