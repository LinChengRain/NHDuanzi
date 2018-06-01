//
//  PhotoViewController.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    private static let identifier = "PhotoViewCell"
    var current_path :String!
    private var nextPage:Int = 0 //下一页
    private var dataArray : [List] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addViews()
        
        loadConstraints();
        
        loadData()
    }
    //MARK: - loadView
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
    private func loadData(){
        let full_url = BASIC_URL + current_path + "\(self.nextPage)-20.json"
        
        NetworkServiceTool.share.requestData(full_url, methodType: .GET, success: { [weak self](response) in
            
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
        }) { (error) in
            self.endRefresh()
        }
    }
    //MARK: - Lazy Method
    private lazy var tableview :UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.backgroundColor = UIColor.red
        tableview.estimatedRowHeight = 50
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.register(JokeViewCell.self, forCellReuseIdentifier: PhotoViewController.identifier)
        return tableview
    }();
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: PhotoViewController.identifier, for: indexPath) as! JokeViewCell
        
        let model = self.dataArray[indexPath.row] as List
        cell.model = model
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentVC = CommentDetailViewController()
        commentVC.jokeId = self.dataArray[indexPath.row].id
        commentVC.currentpage = self.nextPage
        self.navigationController?.pushViewController(commentVC, animated: true)
    }
    
    
    private func loadConstraints() {
        self.tableview.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
}
