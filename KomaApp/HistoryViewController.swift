//
//  HistoryViewController.swift
//  KomaApp
//
//  Created by 天野修一 on 2020/09/23.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit
//import SDWebImage

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    

    @IBOutlet var tableView: UITableView!
    
    
    
    //class変数
    var createdDate = String()
    var imageString = String()
    
    //subClassのインスタンス
    var contentsArray = [Contents]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //データ数(2つ)
        return contentsArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //tag管理
        let imageView = cell.viewWithTag(1) as! UIImageView
        let createdDate = cell.viewWithTag(2) as! String
        
        return cell
    }
    

    

}
