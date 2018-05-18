//
//  JokeViewController.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private static let identifier = "JokeViewCell"
    
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
        let full_url = BASIC_URL + jingxuan + "\(self.nextPage)-20.json"
        
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
            self?.nextPage = jingdianModel.info.np
            
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
        tableview.register(JokeViewCell.self, forCellReuseIdentifier: JokeViewController.identifier)
        return tableview
    }();
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: JokeViewController.identifier, for: indexPath) as! JokeViewCell
        
        let model = self.dataArray[indexPath.row] as List
        // 赋值
        cell.userImgView.af_setImage(withURL: NSURL(string: (model.u?.header![0])!)! as URL)
        cell.nickLabel.text = model.u?.name
        cell.timeLabel.text = model.passtime
        cell.contentLabel.text = model.text
    
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentVC = CommentDetailViewController()
        commentVC.jokeId = self.dataArray[indexPath.row].up
        self.navigationController?.pushViewController(commentVC, animated: true)
    }
    
    
    private func loadConstraints() {
        self.tableview.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
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
