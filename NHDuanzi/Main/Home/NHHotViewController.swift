//
//  NHHotViewController.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

class NHHotViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?
    var controllerArray : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      title = "内涵段子"
        
        addBarTools()
        addViews()
    }
    
    // 导航按钮
    func addBarTools() {
        let refreshBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        refreshBtn.setImage(UIImage(named: "detail_report_normal"), for:UIControlState.normal)
        refreshBtn.addTarget(self, action: #selector(refreshAction(snder:)), for: UIControlEvents.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: refreshBtn)
    }
    
    //子视图
    func addViews() {
        let videoVC = VideoViewController()
        videoVC.current_path = hot_path + movie_url
        videoVC.title = "视频"
        let photoVC = PhotoViewController()
        photoVC.current_path = hot_path + photo_url
        photoVC.title = "图片"
        let jokeVC = JokeViewController()
        jokeVC.current_path = hot_path + joke_url
        jokeVC.title = "段子"
        controllerArray.append(videoVC)
        controllerArray.append(photoVC)
        controllerArray.append(jokeVC)

        let configuration = CAPSPageMenuConfiguration()
        configuration.bottomMenuHairlineColor = UIColor.black
        configuration.unselectedMenuItemLabelColor = UIColor.black
        configuration.selectedMenuItemLabelColor = UIColor.black
        configuration.selectionIndicatorColor = UIColor.black
        configuration.scrollMenuBackgroundColor = RGBColor(240.0,240.0,240.0,1)
        configuration.centerMenuItems = true
        configuration.menuHeight = 40 //滚动菜单高度
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame:CGRect(x: 0, y: NAVIGATIONBAR_HEIGHT, width: MAIN_SCREEN_WIDTH, height: MAIN_SCREEN_HEIGHT-NAVIGATIONBAR_HEIGHT), configuration: configuration)
        self.view.addSubview(pageMenu!.view)
        
    }
    
    // 方法
    @objc func refreshAction(snder:UIControl) {
        print("点击")
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
