//
//  JokeViewCell.swift
//  NHDuanzi
//
//  Created by yuchanglin on 2018/5/18.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit

class JokeViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
    }
    private func addViews() {
        self.contentView.addSubview(self.userImgView)
        self.contentView.addSubview(self.nickLabel)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.contentLabel)
        self.contentView.addSubview(self.zanLabel)
        self.contentView.addSubview(self.chaLabel)
        self.contentView.addSubview(self.commentLabel)

        let lineView1 :UIView = UIView(frame: CGRect.zero)
        lineView1.backgroundColor = UIColor.lightGray
        
        let lineView2 :UIView = UIView(frame: CGRect.zero)
        lineView2.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(lineView1)
        self.contentView.addSubview(lineView2)

        self.userImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.width.height.equalTo(50)
        }
        self.nickLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.userImgView.snp.right).offset(10)
            make.centerY.equalTo(self.userImgView)
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-25)
            make.centerY.equalTo(self.userImgView)
        }
        
        lineView2.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        lineView1.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(lineView2).offset(-35)
            make.height.equalTo(1)
        }
        // 需要自适应高度
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userImgView.snp.bottom).offset(10)
            make.left.equalTo(self.userImgView)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalTo(lineView1).offset(-20)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - Lazy Methods
    /// 内容
    lazy var contentLabel:UILabel = {
        let textLabel = UILabel(frame: CGRect.zero)
        textLabel.text = "段子"
        textLabel.numberOfLines = 0
        return textLabel
    }()
    /// 图像
    lazy var userImgView:UIImageView = {
        let user = UIImageView(frame: CGRect.zero)
        user.layer.cornerRadius = 50 / 2
        user.layer.masksToBounds = true
        return user
    }()
    /// 用户昵称
    lazy var nickLabel:UILabel = {
        let nick = UILabel(frame: CGRect.zero)
        nick.text = "昵称"
        nick.textColor = UIColor.lightGray
        nick.font = UIFont.systemFont(ofSize: 15)
        return nick
    }()
    /// 时间
    lazy var timeLabel:UILabel = {
        let time = UILabel(frame: CGRect.zero)
        time.text = "1小时前"
        time.textColor = UIColor.lightGray
        time.font = UIFont.systemFont(ofSize: 13)
        return time
    }()
    
    /// 点赞
    private lazy var zanLabel:UILabel = {
        let zan = UILabel(frame: CGRect.zero)
        zan.text = "1000"
        return zan
    }()
    
    /// 差评
    private lazy var chaLabel:UILabel = {
        let chaping = UILabel(frame: CGRect.zero)
        chaping.text = "1000"
        return chaping
    }()
    
    /// 评论
    private lazy var commentLabel:UILabel = {
    let comment = UILabel(frame: CGRect.zero)
    comment.text = "1000"
    return comment
    }()
}
