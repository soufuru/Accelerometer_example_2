//
//  ViewController.swift
//  Accelerometer_example2
//
//  Created by SoichiFurukawa on 2017/03/09.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    @IBOutlet var awa: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    
    let motionManager = CMMotionManager()
    
    var timer: Timer!
    var gameTime: Float = 5.0
    var accelerationX: Double!
    var accelerationY: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        if motionManager.isAccelerometerAvailable {
            // 加速度センサーの値取得間隔
            motionManager.accelerometerUpdateInterval = 0.01
            
            // motionの取得を開始
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: { (data, error) in
                
                self.accelerationX = (data?.acceleration.x)!
                
                self.awa.center.x = self.awa.center.x + CGFloat(self.accelerationX*20)
                
                if self.awa.frame.origin.x < 40 {
                    self.awa.frame.origin.x = 40
                }
                if self.awa.frame.origin.x > 260 {
                    self.awa.frame.origin.x = 260
                }
            })
        }
        
    }
    
    func up() {
        gameTime -= 0.1
        timeLabel.text = String(format: "%.1f",gameTime)
        
        if gameTime <= 0 {
            //タイマーストップ
            timer.invalidate()
            
            //画面遷移 タイムアップ時の傾きの情報をresultVCに送る
            self.performSegue(withIdentifier: "resultVC", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
