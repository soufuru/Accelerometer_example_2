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
    
    let motionManager = CMMotionManager()

    var accelerationX: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable {
            // 加速度センサーの値取得間隔
            motionManager.accelerometerUpdateInterval = 0.01
            
            // motionの取得を開始
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: { (data, error) in
                
                
                self.accelerationX = (data?.acceleration.x)!
                self.awa.center.x = self.awa.center.x - CGFloat(self.accelerationX*20)
                
                if self.awa.frame.origin.x < 40 {
                    self.awa.frame.origin.x = 40
                }
                if self.awa.frame.origin.x > 260 {
                    self.awa.frame.origin.x = 260
                }
                                
            })
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
