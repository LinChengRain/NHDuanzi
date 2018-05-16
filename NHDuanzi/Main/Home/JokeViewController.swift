//
//  JokeViewController.swift
//  NHDuanzi
//
//  Created by gz on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private let identifier = "JokeCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addViews()
        
        loadConstraints();
    }
    //MARK: - loadView
    private func addViews() {
        self.view.addSubview(self.tableview)
        
    }
    
    //MARK: - Lazy Method
    private lazy var tableview :UITableView = {
       let tableview = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.backgroundColor = UIColor.red
        tableview.rowHeight = 50
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        return tableview
    }();
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as UITableViewCell
        
        return cell
        
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
