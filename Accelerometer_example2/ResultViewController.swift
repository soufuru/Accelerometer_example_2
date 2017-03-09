//
//  resultViewController.swift
//  Accelerometer_example1
//
//  Created by SoichiFurukawa on 2017/03/08.
//  Copyright © 2017年 soufuru. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var accelerationX: Double!

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let result: Double = fabs(accelerationX*100)
        label.text = String(format: "%.1f°",result)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
