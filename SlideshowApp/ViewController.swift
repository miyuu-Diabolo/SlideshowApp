//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 貞松優海 on 2023/12/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    //イメージの詳細
    var imageIndex = 0
    let images = ["images1", "images2", "images3", "images4", "images5"]
    //タイマーについて
    var timer: Timer?
    //ボタンが押されたらという処理を定義して初期化
    var buttonsEnabled = true
    
    func updateImageView() {
        imageView.image = UIImage(named: images[imageIndex])
    }
    
    @IBAction func toEnlargedImage(_ sender: Any) {
        performSegue(withIdentifier: "enlarged", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //初期のイメージ　最初は0番目
        imageView.image = UIImage(named: images[imageIndex])
        
        // Add tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        //タップした時の処理を呼び出す
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    // タップした時の処理
    @objc func imageTapped() {
        performSegue(withIdentifier: "enlarged", sender: UIImage(named: images[imageIndex]))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enlarged" {
            if let destinationVC = segue.destination as? ResultViewController {
                destinationVC.selectedImage = sender as? UIImage
            }
        }
    }
    //進めるボタンを押された時の処理
    
    @IBOutlet weak var nextImages: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        if buttonsEnabled {
            imageIndex += 1
            if imageIndex == images.count {
                imageIndex = 0
            }
        }
        updateImageView()
    }
    //戻るボタンを押された時の処理
    
    @IBOutlet weak var prev: UIButton!
    @IBAction func prevButton(_ sender: Any) {
        if buttonsEnabled {
            imageIndex -= 1
            if imageIndex < 0 {
                imageIndex = images.count - 1
            }
        }
        updateImageView()
    }
    //再生、停止ボタンを押された時の処理
    @IBAction func autoPlay(_ sender: Any) {
        if timer == nil {
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoPlayTimer), userInfo: nil, repeats: true)
            prev.isEnabled = false
            nextImages.isEnabled = false
        } else {
            timer?.invalidate()
            timer = nil
            prev.isEnabled = true
            nextImages.isEnabled = true
        }
    }
    
    @objc func autoPlayTimer() {
        imageIndex += 1
        if imageIndex == images.count {
            imageIndex = 0
        }
        updateImageView()
    }
}
