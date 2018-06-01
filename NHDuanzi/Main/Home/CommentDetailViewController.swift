//
//  CommentDetailViewController.swift
//  NHDuanzi
//
//  Created by yuchanglin on 2018/5/18.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

class CommentDetailViewController: UIViewController {

    var jokeId:String!
    var currentpage:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let comment_url = BASIC_URL + comment_list + "\(self.jokeId)/0/meinv-iphone-1.3/\(self.currentpage)-20.json"
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
