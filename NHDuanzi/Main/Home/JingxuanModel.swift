//
//  JingxuanModel.swift
//  NHDuanzi
//
//  Created by yuchanglin on 2018/5/15.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

import UIKit


struct JingxuanModel{
    
    var info : Info!
    var list : [List]!
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        if let infoData = dictionary["info"] as? NSDictionary{
            info = Info(fromDictionary: infoData)
        }
        list = [List]()
        if let listArray = dictionary["list"] as? [NSDictionary]{
            for dic in listArray{
                let value = List(fromDictionary: dic)
                list.append(value)
            }
        }
    }
}


struct List{
    
    var bookmark : String?
    var comment : String?
    var down : Int?
    var forward : Int?
    var id : String?
    var passtime : String?
    var shareUrl : String?
    var status : Int?
    var tags : [Tag]
    var text : String?
    var topComment : TopComment?
    var topComments : [TopComment]
    var type : String?
    var u : U?
    var up : String?
    var video : Video?
    var gif : Gif?
    var image : Image?
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        bookmark = dictionary["bookmark"] as? String
        comment = dictionary["comment"] as? String
        down = dictionary["down"] as? Int
        forward = dictionary["forward"] as? Int
        id = dictionary["id"] as? String
        passtime = dictionary["passtime"] as? String
        shareUrl = dictionary["share_url"] as? String
        status = dictionary["status"] as? Int
        tags = [Tag]()
        if let tagsArray = dictionary["tags"] as? [NSDictionary]{
            for dic in tagsArray{
                let value = Tag(fromDictionary: dic)
                tags.append(value)
            }
        }
        text = dictionary["text"] as? String
        if let topCommentData = dictionary["top_comment"] as? NSDictionary{
            topComment = TopComment(fromDictionary: topCommentData)
        }
        topComments = [TopComment]()
        if let topCommentsArray = dictionary["top_comments"] as? [NSDictionary]{
            for dic in topCommentsArray{
                let value = TopComment(fromDictionary: dic)
                topComments.append(value)
            }
        }
        type = dictionary["type"] as? String
        if let uData = dictionary["u"] as? NSDictionary{
            u = U(fromDictionary: uData)
        }
        up = dictionary["up"] as? String
        
        if let videoData = dictionary["video"] as? NSDictionary{
            video = Video(fromDictionary:videoData )
        }
        
        if let gifData = dictionary["gif"] as? [String:Any]{
            gif = Gif(fromDictionary: gifData)
        }
        id = dictionary["id"] as? String
        if let imageData = dictionary["image"] as? [String:Any]{
            image = Image(fromDictionary: imageData)
        }
    }
}

struct TopComment{
    
    var cmtType : String?
    var content : String?
    var hateCount : Int?
    var id : Int?
    var likeCount : Int?
    var passtime : String?
    var precid : Int?
    var preuid : Int?
    var status : Int?
    var u : U?
    var voicetime : Int?
    var voiceuri : String?
    var audio : Audio?
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        cmtType = dictionary["cmt_type"] as? String
        content = dictionary["content"] as? String
        hateCount = dictionary["hate_count"] as? Int
        id = dictionary["id"] as? Int
        likeCount = dictionary["like_count"] as? Int
        passtime = dictionary["passtime"] as? String
        precid = dictionary["precid"] as? Int
        preuid = dictionary["preuid"] as? Int
        status = dictionary["status"] as? Int
        if let uData = dictionary["u"] as? NSDictionary{
            u = U(fromDictionary: uData)
        }
        voicetime = dictionary["voicetime"] as? Int
        voiceuri = dictionary["voiceuri"] as? String
    }
}
struct Info{
    
    var count : Int!
    var np : Int!
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        count = dictionary["count"] as? Int
        np = dictionary["np"] as? Int
    }
}


struct Tag{
    
    var columSet : Int?
    var displayLevel : Int?
    var forumSort : Int?
    var forumStatus : Int?
    var id : Int?
    var imageList : String?
    var info : String?
    var name : String?
    var postNumber : Int?
    var subNumber : Int?
    var tail : String?
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        columSet = dictionary["colum_set"] as? Int
        displayLevel = dictionary["display_level"] as? Int
        forumSort = dictionary["forum_sort"] as? Int
        forumStatus = dictionary["forum_status"] as? Int
        id = dictionary["id"] as? Int
        imageList = dictionary["image_list"] as? String
        info = dictionary["info"] as? String
        name = dictionary["name"] as? String
        postNumber = dictionary["post_number"] as? Int
        subNumber = dictionary["sub_number"] as? Int
        tail = dictionary["tail"] as? String
    }
}
struct U{
    
    var header : [String]?
    var isVip : Bool?
    var name : String?
    var roomIcon : String?
    var roomName : String?
    var roomRole : String?
    var roomUrl : String?
    var sex : String?
    var uid : String?
    var isV : Bool?
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        header = dictionary["header"] as? [String]
        isVip = dictionary["is_vip"] as? Bool
        name = dictionary["name"] as? String
        roomIcon = dictionary["room_icon"] as? String
        roomName = dictionary["room_name"] as? String
        roomRole = dictionary["room_role"] as? String
        roomUrl = dictionary["room_url"] as? String
        sex = dictionary["sex"] as? String
        uid = dictionary["uid"] as? String
        isV = dictionary["is_v"] as? Bool
    }
}
struct Video{
    
    var download : [String]?
    var duration : Int?
    var height : Float?
    var playcount : Int?
    var playfcount : Int?
    var thumbnail : [String]?
    var thumbnail_small : [String]?
    var video : [String]?
    var width : Float?
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        download = dictionary["download"] as? [String]
        duration = dictionary["duration"] as? Int
        height = dictionary["height"] as? Float
        playfcount = dictionary["playfcount"] as? Int
        playcount = dictionary["playcount"] as? Int
        thumbnail = dictionary["thumbnail"] as? [String]
        thumbnail_small = dictionary["thumbnail_small"] as? [String]
        video = dictionary["video"] as? [String]
        width = dictionary["width"] as? Float
    }
}


struct Audio{
    
    var audio : [String]?
    var duration : Int?
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: [String:Any]){
        audio = dictionary["audio"] as? [String]
        duration = dictionary["duration"] as? Int
    }
}


struct Image{
    
    var big : [String]?
    var downloadUrl : [String]?
    var height : Int?
    var medium : [AnyObject]?
    var small : [AnyObject]?
    var thumbnailSmall : [String]?
    var width : Int?
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        big = dictionary["big"] as? [String]
        downloadUrl = dictionary["download_url"] as? [String]
        height = dictionary["height"] as? Int
        medium = dictionary["medium"] as? [AnyObject]
        small = dictionary["small"] as? [AnyObject]
        thumbnailSmall = dictionary["thumbnail_small"] as? [String]
        width = dictionary["width"] as? Int
    }
}

struct Gif{
    
    var downloadUrl : [String]!
    var gifThumbnail : [String]!
    var height : Int!
    var images : [String]!
    var width : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        downloadUrl = dictionary["download_url"] as? [String]
        gifThumbnail = dictionary["gif_thumbnail"] as? [String]
        height = dictionary["height"] as? Int
        images = dictionary["images"] as? [String]
        width = dictionary["width"] as? Int
    }
    
}
