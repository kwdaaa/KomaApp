//
//  TopViewController.swift
//  KomaApp
//
//  Created by 天野修一 on 2020/09/22.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit
import Firebase

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
    
    

    
    
    //database接続後unlock
    @IBAction func historyButton(_ sender: Any) {
        
        showAlert(message: "近日公開")
        //showAlert
/*
        //login
        Auth.auth().signInAnonymously { (authResult, error) in
        let user = authResult?.user
        print(user)
            
            //画面遷移
            let inputVC = self.storyboard?.instantiateViewController(withIdentifier: "historyViewController")as! HistoryViewController
            self.navigationController?.pushViewController(inputVC, animated: true)
            
        }
        
*/
        
        
    }
    
    
    
    
    func showAlert(message : String){
        //      オプションUIAlertController、Actionを使い、要素を指定。
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "OK", style: .cancel,handler: nil)
        
        //      ボタンを押した時にでるポップアップを追加
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet var makeView: UIImageView!
    
    @IBOutlet var historyView: UIImageView!
}
