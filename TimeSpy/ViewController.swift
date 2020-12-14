//
//  ViewController.swift
//  TimeSpy
//
//  Created by Elevgf2 on 14/12/2020.
//

import SwiftUI
import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        workHourStartStepperOutlet.stepValue = 0.25
        workHourEndStepperOutlet.stepValue = 0.25
    }

//Global Variabals
    var startTime:Float = 7
    var endTime:Float = 15.5
//Steppers
    @IBAction func workHourStartStepper(_ sender: Any) {workHourStartLabel.text = String(workHourStartStepperOutlet.value)}
    @IBAction func workHourEndStepper(_ sender: Any) {workHourEndLabel.text = String(workHourEndStepperOutlet.value)}
    @IBOutlet weak var workHourStartStepperOutlet: UIStepper!
    @IBOutlet weak var workHourEndStepperOutlet: UIStepper!
        
//Labels
    @IBOutlet weak var workHourStartLabel: UILabel!
    @IBOutlet weak var workHourEndLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
//Buttons
    @IBAction func calculateHoursButton(_ sender: Any) {updateResultsLabel(newText: String(calculateHours()))}
    
//Functions
    func calculateHours() -> Float{
        return Float(workHourEndStepperOutlet.value - workHourStartStepperOutlet.value - 0.5)
    }
    func updateResultsLabel(newText:String){
        resultsLabel.text = "You have worked for \(calculateHours()) hours"
    }
}

