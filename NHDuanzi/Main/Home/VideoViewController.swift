//
//  VideoViewController.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

private let identifier = "VideoViewCell"
class VideoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var current_path :String!

    private var nextPage:Int = 0 //下一页
    private var dataArray : [List] = []
    //MARK: - system method
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addViews()
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - load view
    private func addViews() {
        self.view.addSubview(self.tableview)
        self.tableview.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.nextPage = 0
            
            self.loadData()
        });
        self.tableview.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
            self.loadData()
        });
    }
    private func endRefresh() {
        self.tableview.mj_header.endRefreshing()
        self.tableview.mj_footer.endRefreshing()
    }
    //MARK: - network method
    
    private func loadData() {
        let full_url = BASIC_URL + current_path + "\(self.nextPage)-20.json"
        
        NetworkServiceTool.share.requestData(full_url, methodType: .GET, params: nil, headers: nil, success: {[weak self] (response) in
            self?.endRefresh()
            let jingdianModel:JingxuanModel = JingxuanModel(fromDictionary: response as! NSDictionary)
            if self?.nextPage == 0 {
                self?.dataArray.removeAll()
                self?.dataArray = jingdianModel.list
            }else {
                if jingdianModel.list.count > 0{
                    self?.dataArray.append(contentsOf: jingdianModel.list)
                }
            }
            guard let np = jingdianModel.info.np else {
                return
            }
            self?.nextPage = np
            
            self?.tableview.reloadData()
        }) {[weak self] (error) in
            
        }
    }
    //MARK: - lazy methods
    private lazy var tableview: UITableView = {
        let tableview = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 100;
        tableview.register(JokeViewCell.self, forCellReuseIdentifier: identifier)
        return tableview
    }()
    //MARK: - UITableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! JokeViewCell
        let model = self.dataArray[indexPath.row] as List
        cell.model = model
        return cell
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
