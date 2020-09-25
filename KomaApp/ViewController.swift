//
//  ViewController.swift
//  KomaApp
//
//  Created by 天野修一 on 2020/09/22.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate {
    
    
    //class変数
    
    var whiteImageArray = [UIImage]()
    var blackImageArray = [UIImage]()
 
    var blackImageViewArray: [UIImageView] = [UIImageView]()
    var whiteImageViewArray: [UIImageView] = [UIImageView]()
    
    var selectedImageViewArray = [UIImageView]()
    
    var scrollCount: Int = 0
    
    var textMessage = ""
    
    //  別ファイルの構造体を取ってくるための変数(インスタンス)
    var komaData = KomaData()

    //多重配列(font、sizeの2つ分)
    var dataArray: [[String]] = []
    
    /* それぞれ入れる配列 */
    var fontPickerArray: [String]!
    var sizePickerArray: [String]!
    
    /* 配列の要素を入れる変数 */
    var font: String!
    var size: String!
    
    
      //紐付けs
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    //セグメント
    @IBAction func whiteBlackSegment(_ sender: Any) {
        
        //選択されているセグメントのインデックス
        /*
        let selectedIndex = whiteBlackSegment.selectedSegmentIndex
        imageView.image = whiteImageArray[0]
                   } else {
                       imageView.image = blackImageArray[0]
                   }
        
        */
    }
    
    @IBAction func boldSegment(_ sender: Any) {
    }
    
    
    //テキスト入力ボタン
    @IBAction func inputButton(_ sender: Any) {
        
        //なにか入力された場合
        if textField.text != "" {
            textMessage = textField.text!
        } else {
            textField.text = "文字を入力してください"
        }
        
        
    }
    
    //テキストフィールド
    @IBOutlet var textField: UITextField!
    
    //picker
    @IBOutlet var pickerView: UIPickerView!
    
    //tapGesture
    @IBAction func tapGesture(_ sender: Any) {
        
    }
    
//Pickerの設定
    func pickerSet() {
        
        //viewDidで起動
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //プロトコル用
        //komaData.delegate = self
        
        /* 配列の値をそれぞれ入れ替え */
        fontPickerArray = komaData.fontPickerArray
        sizePickerArray = komaData.sizePickerArray
        
        /* 多重配列にアペンド */
        dataArray.append(fontPickerArray)
        dataArray.append(sizePickerArray)
        
        //プロトコルに送る&表示する初期値
        font = fontPickerArray[0]
        size = sizePickerArray[0]
    }
    
    //ドラムロールの数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //配列の中の配列の数(3つ)
        return dataArray.count
    }
    
    //列の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataArray[component].count
    }
    
    //表示する列の名前(タイトル)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dataArray[component][row]
    }
    
    //送る値
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if !dataArray[component][row] .isEmpty {
            
            switch component {
            case 0:
                font = dataArray[component][row]
            case 1:
                size = dataArray[component][row]
            
            default:
                break
            }
            
            //プロトコルに送る値
            //komaData.get^^^(font: font, size: size)
        }
    }
    
    
    //viewDid
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerSet()
        
        //準備用code
        //arrayにUIImage画像を格納する(自動的に増やせる)
        while let imageB = UIImage(named: "fukidashiB\(blackImageArray.count)") {
            blackImageArray.append(imageB)
        }
        while let imageW = UIImage(named: "fukidashiW\(whiteImageArray.count)") {
            whiteImageArray.append(imageW)
        }
       
        //上で格納したarrayから、ImageViewのarrayに画像を移す
        /*quita
        for i in blackImageArray {
            
            let imageView = UIImageView()
            imageView.image = UIImageView(blackImageArray[i])
            
            blackImageViewArray.append(UIImageView(image: ))
        }
        */
        
        
        //caucasian youtube
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
        
        scrollScreenWidth = screenSize.width

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

