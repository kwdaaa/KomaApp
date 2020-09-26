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
        
        scrollViewContent()
    }
    
    //セグメント
    @IBOutlet var whiteBlackController: UISegmentedControl!
    
    
    @IBAction func boldSegment(_ sender: Any) {
    }
    
    
    //テキストラベル
    
    @IBOutlet var textLabel: UILabel!
    
    
    
    //テキスト入力ボタン
    @IBAction func inputButton(_ sender: Any) {
        
        //なにか入力された場合
        if textField.text != "" {
            textMessage = textField.text!
            
            textLabel.text = textMessage
            textField.text = ""
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
     
        /*
        
        let sourceImage = imageView.image
        UIGraphicsBeginImageContext(sourceImage!.size);
        let context: CGImage = UIGraphicsGetCurrentContext()! as! CGImage
        let rect:CGRect  = CGRect(x: 0, y: 0, width: sourceImage!.size.width, height: sourceImage!.size.height);

            draw(context as? CGContext, rect, sourceImage!.cgImage);

        // draw your text here

        let resultImage: UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()

        UIImageWriteToSavedPhotosAlbum(imageView.image!, self, Selector(("image:didFinishSavingWithError:contextInfo:")), nil)

        */
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
            
            
            print("font:\(String(describing: font))\nsize:\(String(describing: size))")
            //プロトコルに送る値(String? Int?)
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
       
        /*
        //上で格納したarrayから、ImageViewのarrayにuiimage画像を移す
        
        for image in blackImageArray {
            blackImageViewArray.append(UIImageView(image: image))
        }

         for image in whiteImageArray {
                whiteImageViewArray.append(UIImageView(image: image))
         }
        */
        
        
        //youtube動画
        /*
        for i in 0..<whiteImageArray.count {
            
            //画像を選択
            let whiteImageView = UIImageView()
            whiteImageView.contentMode = .scaleToFill
            
            print("image配列",whiteImageArray[i])
            print("imageView配列？",whiteImageView)
            //x(左上)の位置を決める
            
            let xPosition = self.imageView.frame.width * CGFloat(i)
            whiteImageView.frame = CGRect(x: xPosition, y: 0, width: self.imageView.frame.width, height: self.imageView.frame.height)
            
            whiteImageView.image = whiteImageArray[i]
            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(whiteImageView)
        }
*/
        
        setupScrollView()
    }
    
    
    func setupScrollView() {
        
        //scrollViewの準備
        
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        scrollView.backgroundColor = .clear
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView.addSubview(imageView)
    
//        view.addSubview(scrollView)

        scrollViewContent()
        
    }
    
    
    func scrollViewContent() {
        
        //imageViewのfunc内変数
//        let blackImageView = blackImageViewArray[scrollCount]
//        let whiteImageView = whiteImageViewArray[scrollCount]
//
//        //imageViewの変数の枠を設定
//        blackImageView.frame = CGRect(x: imageView.bounds.width * 0.0, y: imageView.bounds.height * 0.0, width: imageView.bounds.width, height: imageView.bounds.height)
//        imageView.contentMode = UIView.ContentMode.scaleAspectFit
//
//        whiteImageView.frame = CGRect(x: imageView.bounds.width * 0.0, y: imageView.bounds.height * 0.0, width: imageView.bounds.width, height: imageView.bounds.height)
//        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        //UIImageのまま表示
        /*変数は不要
        let blackImage = blackImageArray[scrollCount]
        let whiteImage = whiteImageArray[scrollCount]
        */
//        imageView.contentMode = .scaleToFill
        
        switch whiteBlackController.selectedSegmentIndex {
        case 0:
//            scrollView.addSubview(whiteImageView)
            imageView.image = whiteImageArray[scrollCount]
            
/*
scrollViewでimage(or imageView)をスクロールできるようにする！！
*/
            
        case 1:
//            scrollView.addSubview(blackImageView)
            imageView.image = blackImageArray[scrollCount]
        default:
            break
        }
        
        
//            scrollCount += 1
        
        /*
        let firstImageView = blackImageViewArray[0]
        //変数の枠を設定
//        firstImageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        firstImageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        scrollView.addSubview(firstImageView)
        
        let secondImageView = blackImageViewArray[1]
//        //変数の枠を設定
//        secondImageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        secondImageView.contentMode = UIView.ContentMode.scaleAspectFit
        scrollView.addSubview(secondImageView)
        
        */
    }
    
    

 

    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//           textLabel.text = textField.text
           self.view.endEditing(true)
    }

}
