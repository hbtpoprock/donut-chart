//
//  ViewController.swift
//  TestProject
//
//  Created by itribdev5 on 14/11/20.
//  Copyright © 2020 itribdev5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chart: CircularProgressMeter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chart.progressArray = [0.0234, 0.2345, 0.0545, 0.1435, 0.5441]
    }
    
    func tetst() {
        
    }

}

