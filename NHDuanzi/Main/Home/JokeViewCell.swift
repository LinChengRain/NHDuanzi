//
//  JokeViewCell.swift
//  NHDuanzi
//
//  Created by yuchanglin on 2018/5/18.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit
import SnapKit
class JokeViewCell: UITableViewCell {
    
    var newModel:List!
    var lineView:UIView!
    var bigView:UIView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
    }
    private func addViews() {
        let bgView = UIView()
        self.bigView = bgView
        bgView.backgroundColor = UIColor.red
        self.contentView.addSubview(bgView)
        bgView.addSubview(self.userImgView)
        bgView.addSubview(self.nickLabel)
        bgView.addSubview(self.timeLabel)
        bgView.addSubview(self.contentLabel)
        bgView.addSubview(self.zanLabel)
        bgView.addSubview(self.chaLabel)
        bgView.addSubview(self.commentLabel)
        bgView.addSubview(self.centerImgVIew)
        
        let lineView1 :UIView = UIView(frame: CGRect.zero)
        lineView1.backgroundColor = UIColor.lightGray
        self.lineView = lineView1

        let lineView2 :UIView = UIView(frame: CGRect.zero)
        lineView2.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(lineView1)
        self.contentView.addSubview(lineView2)

        bgView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 0, 0, 0))  // 第2步：设置uItemBox与“Cell的contentView”边缘对齐，可以有空隙，没必要一定是(0, 0, 0, 0)
        }
        
        self.userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(bgView).offset(20)
            make.top.equalTo(bgView).offset(20)
            make.width.height.equalTo(50)
        }
        self.nickLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.userImgView.snp.right).offset(10)
            make.centerY.equalTo(self.userImgView)
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(bgView).offset(-25)
            make.centerY.equalTo(self.userImgView)
        }
        
        // 需要自适应高度
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.userImgView.snp.bottom).offset(10)
            make.left.equalTo(self.userImgView)
            make.right.equalTo(bgView).offset(-30)
        }
        self.centerImgVIew.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentLabel)
            make.right.equalTo(self.contentLabel)
            //给一个默认的高度值
            make.height.equalTo(0)
            make.bottom.equalTo(lineView1.snp.top).offset(-10)
        }
        
        lineView2.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(bgView).offset(-10)
            make.height.equalTo(1)
        }
        
        lineView1.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(lineView2).offset(-35)
            make.height.equalTo(1)
        }
    }
    
    var model:List {
        set {
            self.newModel = newValue
            // 赋值
            self.userImgView.af_setImage(withURL: NSURL(string: (self.newModel.u?.header![0])!)! as URL)
            self.nickLabel.text = self.newModel.u?.name
            self.timeLabel.text = self.newModel.passtime
            self.contentLabel.text = self.newModel.text
            
            if newModel.type == "video" {
                self.centerImgVIew.alpha = 1
                self.centerImgVIew.af_setImage(withURL: NSURL(string: (self.newModel.video?.thumbnail![0])!)! as URL)
    
                self.centerImgVIew.snp.updateConstraints { (make) in
                    make.height.equalTo(CGFloat((self.newModel.video?.height)!)*((MAIN_SCREEN_WIDTH - 40)/CGFloat((self.newModel.video?.width)!)))
                }
            }else if newModel.type == "image"{
                self.centerImgVIew.alpha = 1
                self.centerImgVIew.af_setImage(withURL: NSURL(string: (self.newModel.image?.thumbnailSmall![0])!)! as URL)
                
                self.centerImgVIew.snp.updateConstraints { (make) in
                    make.height.equalTo(200)
                }
            }else if newModel.type == "gif"{
                self.centerImgVIew.alpha = 1
                self.centerImgVIew.af_setImage(withURL: NSURL(string: (self.newModel.gif?.gifThumbnail![0])!)! as URL)
                
                self.centerImgVIew.snp.updateConstraints { (make) in
                    make.height.equalTo(200)
                }
            }else{
                 self.centerImgVIew.alpha = 0
            }
        }
        get {
            return self.newModel
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
    
    /// 图片或视频
    private lazy var centerImgVIew:UIImageView = {
        let imageview = UIImageView(frame: CGRect.zero)
        imageview.alpha = 0
        return imageview
    }()
}
