//
//  ViewController.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataArray : [List] = []
    var nextPage : Int = 0
    let Base_Url = "http://s.budejie.com/topic/list/jingxuan/29/meinv-iphone-1.3/"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        let model = self.dataArray[indexPath.row]
        
        cell.textLabel?.text = model.text
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
        
       self.view.addSubview(self.tableview)
        
        self.tableview.refreshControl = refreshControl
    }
    
    private lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: UIControlEvents.touchUpInside)
        refreshControl.attributedTitle = NSAttributedString(string:"Refresh")
        return refreshControl
    }()
    
    private lazy var moreControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadMoreData), for: UIControlEvents.touchUpInside)
        refreshControl.attributedTitle = NSAttributedString(string:"Refresh")
        return refreshControl
    }()
    
    private lazy var tableview : UITableView = {
        let tableview = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 50
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableview
    }()
    
    func loadData(_ next:Int = 0){
        let url = Base_Url + "\(next)-20.json"
        NetworkServiceTool.share.requestData(url, methodType: .GET, success: { [weak self] (response) in
            let model = JingxuanModel(fromDictionary: response as! NSDictionary)
            print(model.info!)
            
            self?.dataArray = model.list
            self?.tableview.reloadData()
            self?.nextPage = model.info.np
            
            self?.refreshControl.endRefreshing()
        }) { (error) in
            
        }
    }
    // 上拉加载更多
    @objc func loadMoreData() {
        
        loadData(self.nextPage)
    }
    // 刷新
    @objc func refreshData() {
        
        loadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

