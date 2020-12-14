//
//  ViewController.swift
//  TimeSpy
//
//  Created by Elevgf2 on 14/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//Steppers
    @IBAction func workHourStartStepper(_ sender: Any) {}
    @IBAction func workHourEndStepper(_ sender: Any) {}
    
//Labels
    @IBOutlet weak var workHourStartLabel: UILabel!
    @IBOutlet weak var workHourEndLabel: UILabel!
    
    
}

