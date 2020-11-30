//
//  ViewController.swift
//  TestProject
//
//  Created by itribdev5 on 14/11/20.
//  Copyright © 2020 itribdev5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chart: DonutChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chart.progressArray = [0.1435, 0.0234, 0.5441, 0.0545, 0.2345]
//        chart.progressArray = [0.1435, 0.0234]
//        chart.progressArray = [0.2,0.4]
        
    }

}

