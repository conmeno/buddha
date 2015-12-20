//
//  Data.swift
//  Buddha2
//
//  Created by Phuong Nguyen on 6/9/15.
//  Copyright (c) 2015 Phuong Nguyen. All rights reserved.
//

import Foundation

class Data {
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
//    1. Queen Maha Maya's Dream
//    2. The Birth of the Prince
//    3. The Naming Ceremony
//    4. The Prince's Education
//    5. Prince Siddhartha's Kindness
//    6. Prince Siddhartha's Wife
//    7. The Four Sights: Old Age
//    8. The Four Sights: Sickness
//    9. The Four Sights: Death
//    10. The Four Sights: a Monk
//    11. The Prince Leaves Home
//    12. King Bimbisara's Offer
//    13. The Buddha's First Teachers
//    14. Six Years of Searching
//    15. The Golden Bowl
//    16. Striving for Enlightenment
//    17.  The Sun of Enlightenment Shines
//    18. Seven Weeks After Enlightenment
//    19. The First Five Monks
//    20. The Buddha's First Teaching
//    21. The Serpent King
//    22. Returning Home
//    23. The Story of Princess Yasodhara
//    24. The Story of Prince Nanda
//    25. The Story of Prince Rahula
//    26. The Two Chief Disciples
//    27. The Story of Poor Sopaka
//    28. The Story of Lady Patacara
//    29 . Angulimala, the Bandit
//    30. Wakkali and the Buddha
//    31. Sunita, the Scavenger
//    32. The Buddha and the Sick Monk
    let places = [
        Entry(ID: 1,NType: 1,adType: 2, Name: "Pictures Summary", Title:"Pictures Summary", Value: "33", Icon: "icon33.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "1. Queen Maha Maya's Dream", Title:"1. Queen Maha Maya's Dream", Value: "1", Icon: "icon17.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "2. The Birth of the Prince", Title:"2. The Birth of the Prince", Value: "2", Icon: "icon2.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "3. The Naming Ceremony", Title:"3. The Naming Ceremony", Value: "3", Icon: "icon3.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "4. The Prince's Education", Title:"4. The Prince's Education", Value: "4", Icon: "icon4.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "5. Prince Siddhartha's Kindness", Title:"5. Prince Siddhartha's Kindness", Value: "5", Icon: "icon5.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "6. Prince Siddhartha's Wife", Title:"6. Prince Siddhartha's Wife", Value: "6", Icon: "icon6.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "7. The Four Sights: Old Age", Title:"7. The Four Sights: Old Age", Value: "7", Icon: "icon7.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "8. The Four Sights: Sickness", Title:"8. The Four Sights: Sickness", Value: "8", Icon: "icon27.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "9. The Four Sights: Death", Title:"9. The Four Sights: Death", Value: "9", Icon: "icon9.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "10. The Four Sights: a Monk", Title:"10. The Four Sights: a Monk", Value: "10", Icon: "icon10.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "11. The Prince Leaves Home", Title:"11. The Prince Leaves Home", Value: "11", Icon: "icon11.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "12. King Bimbisara's Offer", Title:"12. King Bimbisara's Offer", Value: "12", Icon: "icon12.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "13. The Buddha's First Teachers", Title:"13. The Buddha's First Teachers", Value: "13", Icon: "icon13.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "14. Six Years of Searching", Title:"14. Six Years of Searching", Value: "14", Icon: "icon14.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "15. The Golden Bowl", Title:"15. The Golden Bowl", Value: "15", Icon: "icon15.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "16. Striving for Enlightenment", Title:"16. Striving for Enlightenment", Value: "16", Icon: "icon16.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "17.  The Sun of Enlightenment Shines", Title:"17.  The Sun of Enlightenment Shines", Value: "17", Icon: "icon17.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "18. Seven Weeks After Enlightenment", Title:"18. Seven Weeks After Enlightenment", Value: "18", Icon: "icon18.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "19. The First Five Monks", Title:"19. The First Five Monks", Value: "19", Icon: "icon19.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "20. The Buddha's First Teaching", Title:"20. The Buddha's First Teaching", Value: "20", Icon: "icon20.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "21. The Serpent King", Title:"21. The Serpent King", Value: "21", Icon: "icon33.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "22. Returning Home", Title:"22. Returning Home", Value: "22", Icon: "icon22.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "23. The Story of Princess Yasodhara", Title:"23. The Story of Princess Yasodhara", Value: "23", Icon: "icon23.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "24. The Story of Prince Nanda", Title:"24. The Story of Prince Nanda", Value: "24", Icon: "icon24.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "25. The Story of Prince Rahula", Title:"25. The Story of Prince Rahula", Value: "25", Icon: "icon25.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "26. The Two Chief Disciples", Title:"26. The Two Chief Disciples", Value: "26", Icon: "icon26.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "27. The Story of Poor Sopaka", Title:"27. The Story of Poor Sopaka", Value: "27", Icon: "icon27.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "28. The Story of Lady Patacara", Title:"28. The Story of Lady Patacara", Value: "28", Icon: "icon28.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "29 . Angulimala, the Bandit", Title:"29 . Angulimala, the Bandit", Value: "29", Icon: "icon29.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "30. Wakkali and the Buddha", Title:"30. Wakkali and the Buddha", Value: "30", Icon: "icon30.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "31. Sunita, the Scavenger", Title:"31. Sunita, the Scavenger", Value: "31", Icon: "icon31.png",URL: ""),
        Entry(ID: 1,NType: 1,adType: 1, Name: "32. The Buddha and the Sick Monk", Title:"32. The Buddha and the Sick Monk", Value: "32", Icon: "icon32.png",URL: "")
        
        
 
        
        
    ]
    
}
