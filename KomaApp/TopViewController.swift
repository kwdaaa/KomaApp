//
//  TopViewController.swift
//  KomaApp
//
//  Created by 天野修一 on 2020/09/22.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    @IBAction func makeButton(_ sender: Any) {
        
        //画面遷移
        let inputVC = self.storyboard?.instantiateViewController(withIdentifier: "makeViewController")as! ViewController
        self.navigationController?.pushViewController(inputVC, animated: true)
    }
    
    @IBAction func historyButton(_ sender: Any) {
        
        
        //画面遷移
        let inputVC = self.storyboard?.instantiateViewController(withIdentifier: "historyViewController")as! HistoryViewController
        self.navigationController?.pushViewController(inputVC, animated: true)
        
    }
    
    @IBOutlet var makeView: UIImageView!
    
    @IBOutlet var historyView: UIImageView!
}
