//
//  Data.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/9/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import Foundation

class Data1 {
    class Entry {
        let ID: Int
        let NType: Int// type=1 => web file , type =2 web link
            let adType: Int // adType =1 admob, adType =2 FB
let Name : String
        let Title : String
        let Value : String
        let Icon: String
        let URL : String
        init(ID: Int,NType: Int,adType: Int, Name : String,Title: String, Value : String,Icon: String, URL : String) {
            self.ID=ID
            self.NType = NType
self.adType = adType
            self.Name = Name
            self.Title = Title
            self.Value = Value
            self.Icon = Icon
            self.URL = URL
        }
    }
    //["Lời nói đầu",Thường và Vô thường,Nhân quả báo ứng cùng luật nhân quả "66 đều phật dạy", "Chú đại bi", "Mười công đức án tống kinh", "Tin tức phật giáo"]

    var places = [
        Entry(ID: 1,NType: 1,adType: 2, Name: "Sơ lược về phật giáo", Title:"Sơ lược về phật giáo", Value: "soluoc", Icon: "icon5.png",URL: ""),
        Entry(ID: 2,NType: 1,adType: 1, Name: "66 đều phật dạy", Title:"",Value: "66phatday", Icon: "icon2.png",URL: ""),
        Entry(ID: 3,NType: 1,adType: 1, Name: "Chú đại bi", Title:"",Value: "chudaibi", Icon: "icon3.png",URL: ""),
        Entry(ID: 4,NType: 1,adType: 1, Name: "Thường và Vô thường", Title:"",Value: "vothuong", Icon: "icon4.png",URL: ""),
        Entry(ID: 4,NType: 1,adType: 1, Name: "Mười công đức án tống kinh", Title:"",Value: "10congduc", Icon: "icon9.png",URL: ""),
        Entry(ID: 5,NType: 1,adType: 1, Name: "Nhân quả báo ứng cùng luật nhân quả", Title:"",Value: "NhanQua", Icon: "icon8.png",URL: ""),
        Entry(ID: 5,NType: 1,adType: 1, Name: "Kinh nhân quả", Title:"",Value: "kinhnhanqua", Icon: "icon10.png",URL: ""),
        Entry(ID: 5,NType: 2,adType: 1, Name: "Nhạc thiền", Title:"",Value: "", Icon: "icon7.png",URL: "http://vuonhoaphatgiao.com/thu-vien-audio/am-nhac/nhac-thien/"),
        Entry(ID: 6,NType: 2,adType: 1, Name: "Vườn hoa phật giáo", Title:"",Value: "", Icon: "icon13.png",URL: "http://vuonhoaphatgiao.com/"),
        Entry(ID: 7,NType: 2,adType: 1, Name: "Tin tức phật giáo giacngo.vn", Title:"",Value: "", Icon: "icon6.png",URL: "http://giacngo.vn"),
Entry(ID: 8,NType: 3,adType: 1, Name: "Thank You.", Title:"",Value: "", Icon: "icon8.png",URL: "http://giacngo.vn")
    ]
    
}
