//
//  ViewController.swift
//  KomaApp
//
//  Created by 天野修一 on 2020/09/22.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit
//import Firebase

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate {
    
    
    //class変数
    
    var whiteImageArray = [UIImage]()
    var blackImageArray = [UIImage]()
 
    /*
    var blackImageViewArray: [UIImageView] = [UIImageView]()
    var whiteImageViewArray: [UIImageView] = [UIImageView]()
    
    var selectedImageViewArray = [UIImageView]()
    */
    var scrollCount: Int = 0
    
    //  別ファイルの構造体を取ってくるための変数(インスタンス) => ファイル分けた意味あんまなかった
    var komaData = KomaData()

    //多重配列(font、sizeの2つ分)
    var dataArray: [[String]] = []
    
    /* それぞれ入れる配列 */
    var fontPickerArray: [String]!
    var sizePickerArray: [String]!
    
    /* 配列の要素を入れる変数 */
    var font: String!
    var size: Int!
    
      //紐付けs
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var screenShotView: UIView!
    
    //セグメント
    @IBAction func whiteBlackSegment(_ sender: Any) {
        
        scrollViewContent()
    }
    
    //セグメント
    @IBOutlet var whiteBlackController: UISegmentedControl!
    
    
    @IBOutlet var boldController: UISegmentedControl!
    
    
    
    
/*  //フォント名で文字の太さを決めるため、役に立たない
    @IBAction func boldSegment(_ sender: Any) {
        
        if size == nil {
            showAlert(message: "文字サイズを選んでださい")
            
        } else {
            switch boldController.selectedSegmentIndex {
            case 0:
                textLabel.font = UIFont.systemFont(ofSize: CGFloat(size!))
                print("hosoi?")
                
            case 1:
                textLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(size!))
                print("futoi?")
            default:
                break
            }
        }
     }
*/


    
    
    //テキストラベル
    
    @IBOutlet var textLabel: UILabel!
    
    
    
    
    
    //テキスト入力ボタン
    @IBAction func inputButton(_ sender: Any) {
        
        //なにも入力されなかった場合
        if textField.text == "" {
            showAlert(message: "文字を入力してください")
            
        } else {
        //なにか入力された場合
            
                //セグメントが0のとき
                if whiteBlackController.selectedSegmentIndex == 0 {
                //textLabelのカラーを変更
                textLabel.textColor = .black
                } else{
                //textLabelのカラーを変更
                textLabel.textColor = .white
                }

            //picker初期値の設定が面倒なので、pickerで設定されたかどうかの
            //nilチェック => そのままだとnil
            if font == nil || size == nil {
            
                showAlert(message: "文字サイズとフォントを選んでください")
                //textLabel.text = "文字サイズとフォントを選んでください"

                //textLabel.font = UIFont(name: "\(String(font!))", size: CGFloat(size!))
                //textLabel.font = textLabel.font.withSize(CGFloat(size!))
            
            } else {
            //Pickerで設定された場合
                
                let textMessage = textField.text!
                           textLabel.text = textMessage
                       
                           print(textMessage)
                           
                           textField.text = ""
                //fontとsizeの値を指定
                //textLabel.font = UIFont(name: "\(font)", size: CGFloat(size))
                //siseだけ
                textLabel.font = textLabel.font.withSize(CGFloat(size!))
            }//pickerのnilチェックのif
            
        }//textがnilかどうかをチェックするif
        
        print("font:\(String(describing: font))\nsize:\(String(describing: size))")
        
    }//func
    
    //テキストフィールド
    @IBOutlet var textField: UITextField!
    
    //picker
    @IBOutlet var pickerView: UIPickerView!
    
//    var tapCount: Int = 0
    //tapGesture
    @IBAction func tapGesture(_ sender: Any) {
     
        
        saveAlert(message: "保存しますか？")
        //takeScreenShot()
        
//        tapCount += 1
//        print(tapCount)
    }
    
//Pickerの設定
    func pickerSet() {
        
        //viewDidで起動
//        pickerView.delegate = self
//        pickerView.dataSource = self
        
        //プロトコル用
        //komaData.delegate = self
        
        /* 配列の値をそれぞれ入れ替え */
        fontPickerArray = komaData.fontPickerArray
        sizePickerArray = komaData.sizePickerArray
        
        /* 多重配列にアペンド */
        dataArray.append(fontPickerArray)
        dataArray.append(sizePickerArray)
        
        //プロトコルに送る&表示する初期値
        //font = fontPickerArray[0]
        //size = sizePickerArray[0]
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
                //textLabel.font = UIFont(name: font, size: CGFloat(Int(size)))
            case 1:
                size = Int(dataArray[component][row])
                
            default:
                break
            }
            
            //ラベルのフォントとサイズを変更
//            textLabel.font = textLabel.font.withSize(CGFloat(size!))
//
//            print("font:\(String(describing: font))\nsize:\(String(describing: size))")

            //プロトコルに送る値(String? Int?) = 送らなくてok?
            //komaData.get^^^(font: font, size: size)
        }
    }
    
    
    //viewDid
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
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
    
    //scrollView使用は断念（泣）
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
        

        //let firstImageView = blackImageViewArray[0]
        //変数の枠を設定
//        firstImageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0,
//        width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        firstImageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        //scrollView.addSubview(firstImageView)
    }
    
    
    
 func takeScreenShot() {

        let width = screenShotView.bounds.width
        let height = screenShotView.bounds.height
        let size = CGSize(width: width, height: height)

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

    self.screenShotView.drawHierarchy(in: scrollView.bounds.offsetBy(dx: 0, dy: 0), afterScreenUpdates: true)                         //0点合わせ
            screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        UIImageWriteToSavedPhotosAlbum(screenShotImage, nil, nil, nil)
    }

    var screenShotImage = UIImage()
    
    
    
    func showAlert(message : String){
            //      オプションUIAlertController、Actionを使い、要素を指定。
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            
            let close = UIAlertAction(title: "OK", style: .cancel,handler: nil)
            
            //      ボタンを押した時にでるポップアップを追加
            alert.addAction(close)
            
            present(alert, animated: true, completion: nil)
        
    }
    
    
    func saveAlert(message: String){
        
        //UIAlertControllerで初期設定
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        //UIAletActionでalertの要素を定義＆追加
        let save = UIAlertAction(title: "保存", style: .default, handler: {(action:UIAlertAction!) -> Void in
            
            //スクショを撮る
            self.takeScreenShot()
            //撮れたとメッセージ
            self.showAlert(message: "保存しました！")
            
            //画面遷移したい！
        })
        
        //UIAletActionでalertの要素を定義＆追加
        let close = UIAlertAction(title: "閉じる", style: .cancel,handler: nil)
        
/*バグの原因
        {(action:UIAlertAction!) -> Void in

            self.present(alert, animated: true, completion: nil)
        })
*/
        
        alert.addAction(save)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        
        
    }//func
    
    
    
 
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//           textLabel.text = textField.text
           self.view.endEditing(true)
    }

    
    
}
//テスターだよ！
//
//    @IBAction func testButton(_ sender: Any) {
//    saveAlert(message: "保存しますか？")
//    }

