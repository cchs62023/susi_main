//
//  ViewController.swift
//  susi_main
//
//  Created by 林家齊 on 2024/9/1.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
var player = AVPlayer() // 讓下面有聲音
    
    @IBOutlet weak var priceLabel: UILabel!  // 顯示當前價格
    
    @IBOutlet weak var budgetLabel: UILabel! // 顯示剩餘預算
    
    @IBOutlet weak var stepper: UIStepper! // 調整價格的步進器
    
    @IBOutlet weak var sizeSlider: UISlider! // 調整壽司大小的滑塊
    
    @IBOutlet weak var getSushiButton: UIButton!
    
    @IBOutlet weak var susiImage: UIImageView! // 顯示壽司圖片
    
    
    
    // MARK: - Properties
      var price: Int = 40 {
          didSet {
              updateUI()  // 當價格改變時更新UI
          }
      }
      var budget: Int = 500 {
          didSet {
              updateUI()  // 當預算改變時更新UI
          }
      }
      var sushiSize: Float = 0.5 {
          didSet {
              updateSushiSize()  // 當壽司大小改變時更新壽司圖片大小
          }
      }

      // MARK: - View Lifecycle
      override func viewDidLoad() {
          super.viewDidLoad()
          setupInitialState()  // 設置初始狀態
      }

      // MARK: - Setup
      func setupInitialState() {
          // 配置步進器
          stepper.minimumValue = 0
          stepper.maximumValue = Double(budget)
          stepper.stepValue = 40
          stepper.value = Double(price)

          // 設置滑塊初始值
          sizeSlider.value = sushiSize

          updateUI()          // 更新UI顯示
          updateSushiSize()   // 更新壽司大小
      }

      // MARK: - UI Updates
      func updateUI() {
          // 更新價格和預算標籤
          priceLabel.text = "\(price)"
          budgetLabel.text = "\(budget)"
          
          // 如果預算不足，禁用步進器和獲取壽司按鈕
          stepper.isEnabled = budget >= 40
          getSushiButton.isEnabled = budget >= 40
      }

      func updateSushiSize() {
          // 根據滑塊值調整壽司圖片大小
          let scale = CGAffineTransform(scaleX: CGFloat(sushiSize), y: CGFloat(sushiSize))
          UIView.animate(withDuration: 0.3) {
              self.susiImage.transform = scale
          }
      }

      // MARK: - Actions
      @IBAction func stepperValueChanged(_ sender: UIStepper) {
          // 當步進器值改變時，更新價格和預算
          let newPrice = Int(sender.value)
          budget += price - newPrice  // 調整預算
          price = newPrice            // 更新價格
      }

      @IBAction func getSushiButtonTapped(_ sender: UIButton) {
          // 當點擊獲取壽司按鈕時
          if budget >= 40 {
              price += 40   // 增加價格
              budget -= 40  // 減少預算
          }
      }

      @IBAction func sizeSliderChanged(_ sender: UISlider) {
          // 當滑塊值改變時，更新壽司大小
          sushiSize = sender.value
      }
    
    
    // 等補一個reset
    
    
    
    
    
    
        
    @IBAction func getSushiButtonClick()
    { // **`紅色：移除了參數，改為實例方法`**
            let names = ["susi-1", "susi-2", "susi-3", "susi-4", "susi-5", "susi-6", "susi-7"]
            let name = names.randomElement() ?? "susi-1"
            susiImage.image = UIImage(named: name) //
        let url = URL(string: "https://taira-komori.jpn.org/sound_os2/electric01/power_point2.mp3")!
                let playerItem = AVPlayerItem(url:url)
                player = AVPlayer(playerItem: playerItem)
                player.play()
        
    }
    
    
    
    }



        
    

