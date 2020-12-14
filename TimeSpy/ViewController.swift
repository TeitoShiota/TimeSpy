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
        workHourStartLabel.text = "7:00"
        workHourEndLabel.text = "12:00"
    }

//Global Variabals
    var startTime:Float = 7
    var endTime:Float = 15.5
//Steppers
    @IBAction func workHourStartStepper(_ sender: Any) {workHourStartLabel.text = "\(String(Int(workHourStartStepperOutlet.value)))\(convertDecimalHoursToString(Float(workHourStartStepperOutlet.value), true))"}
    @IBAction func workHourEndStepper(_ sender: Any) {workHourEndLabel.text = "\(String(Int(workHourEndStepperOutlet.value)))\(convertDecimalHoursToString(Float(workHourEndStepperOutlet.value), true))"}
    @IBOutlet weak var workHourStartStepperOutlet: UIStepper!
    @IBOutlet weak var workHourEndStepperOutlet: UIStepper!
        
//Labels
    @IBOutlet weak var workHourStartLabel: UILabel!
    @IBOutlet weak var workHourEndLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
//Buttons
    @IBAction func calculateHoursButton(_ sender: Any) {updateResultsLabel()}
    
//Functions
    
    func calculateHours() -> Float{
        var result:Float = Float(workHourEndStepperOutlet.value - workHourStartStepperOutlet.value)
        if workHourEndStepperOutlet.value >= 12.5{
            result -= 0.5
        } else if workHourEndStepperOutlet.value >= 12.25{
            result -= 0.25
        }
        return result
    }
    
    func updateResultsLabel(){
        resultsLabel.text = "You have worked for \(Int(calculateHours())) hours\(convertDecimalHoursToString(calculateHours(), false))"
    }
    
//Takes work hours as input and returns a containing the floating point fraction of hours converted into a matching text
    func convertDecimalHoursToString(_ var1:Float, _ noText:Bool) -> String {
        var result:String = ""
        let hoursInFractions: Float = (var1 - floor(var1))
        if noText == true {
            switch hoursInFractions {
            case 0.25:
                result = ":15"
            case 0.5:
                result = ":30"
            case 0.75:
                result = ":45"
            default:
                result = ":00"
            }
        } else {
        switch hoursInFractions {
        case 0.25:
            result = " and 15 minutes"
        case 0.5:
            result = " and 30 minutes"
        case 0.75:
            result = " and 45 minutes"
        default:
            result = ""
            }
        }
        return result
    }
}

