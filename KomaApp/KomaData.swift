//
//  KomaData.swift
//  KomaApp
//
//  Created by 天野修一 on 2020/09/25.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import Foundation


struct KomaData {
    let fontPickerArray = ["けいふぉんと","やさしさｱﾝﾁｯｸ"]
    let sizePickerArray = ["15","16","17","18","19","20"]
    
    
    
    
    
    
}
    //フォントインストール
    //サイズ調整
    
// Database用
class Contents{
    var createdDate: String = ""
    var imageString: String = ""
    
    //databaseの行き来で初期化する必要があるため記述
    init(createdDate: String, imageString: String) {
        self.createdDate = createdDate
        self.imageString = createdDate
    }
    
}
