//
//  ViewController.swift
//  KomaApp
//
//  Created by 天野修一 on 2020/09/22.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    //class変数
    
    var whiteImageArray = [UIImage]()
    var blackImageArray: [UIImage] = [UIImage]()
 
    var blackImageViewArray: [UIImageView] = [UIImageView]()
    var whiteImageViewArray: [UIImageView] = [UIImageView]()
    
    var scrollCount: Int = 0
    
    
    
      //紐付けs
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    
    @IBAction func whiteBlackSegment(_ sender: Any) {
        
        
    }
    
    @IBOutlet var textField: UITextField!
    
    
    @IBOutlet var pickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //準備用code
        //arrayにUIImage画像を格納する(自動的に増やせる)
        while let imageB = UIImage(named: "fukidashiB\(blackImageArray.count)") {
            blackImageArray.append(imageB)
        }
        while let imageW = UIImage(named: "fukidashiW\(whiteImageArray.count)") {
            whiteImageArray.append(imageW)
        }
       
        //上で格納したarrayから、ImageViewのarrayに画像を移す
        /*
        for i in blackImageArray {
            
            let imageView = UIImageView()
            imageView.image = UIImageView(blackImageArray[i])
            
            blackImageViewArray.append(UIImageView(image: ))
        }
        */
        
        /*
        for i in 0..<whiteImageArray.count {
            
            //画像を選択
            let whiteImageView = UIImageView()
            whiteImageView.contentMode = .scaleToFill
            
            
            print("あれい",whiteImageArray[i])
            print("写った？",whiteImageView)
            //x(左上)の位置を決める
            
            let xPosition = self.imageView.frame.width * CGFloat(i)
            whiteImageView.frame = CGRect(x: xPosition, y: 0, width: self.imageView.frame.width, height: self.imageView.frame.height)
            
            whiteImageView.image = whiteImageArray[i]

            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(whiteImageView)
        }
*/

        
//        setupScrollView()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //setupScrollView()
    }
    
    /*
    func setupScrollView() {
        
        //scrollViewの準備
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = .white
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = true

        view.addSubview(scrollView)
        
        
        scrollViewContent()
        
        
    }
    
    
    func scrollViewContent() {
        /*
        let imageView = blackImageViewArray[scrollCount]
        //変数の枠を設定
        imageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        scrollView.addSubview(imageView)
            
            scrollCount += 1
        */
        
        let firstImageView = blackImageViewArray[0]
        //変数の枠を設定
        firstImageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        firstImageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        scrollView.addSubview(firstImageView)
        
        
        
        let secondImageView = blackImageViewArray[1]
        //変数の枠を設定
        secondImageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        secondImageView.contentMode = UIView.ContentMode.scaleAspectFit
        scrollView.addSubview(secondImageView)
        
        
    }
    */
    
 

    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    
    
  

   

}

