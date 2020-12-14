//
//  ViewController.swift
//  TimeSpy
//
//  Created by Lasse Karahan Kristiansen on 14/12/2020.
//

import SwiftUI
import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        workHourStartStepperOutlet.stepValue = 0.25 //Changes the default step value from 1 to 0.25.
        workHourEndStepperOutlet.stepValue = 0.25 //Changes the default step value from 1 to 0.25.
        workHourStartLabel.text = "7:00" //Sets the placeholder text for starting label on startup.
        workHourEndLabel.text = "12:00" //Sets the placeholder text for ending label on startup.
    }
    
//Steppers
    @IBAction func workHourStartStepper(_ sender: Any) {workHourStartLabel.text = "\(String(Int(workHourStartStepperOutlet.value)))\(convertDecimalHoursToString(Float(workHourStartStepperOutlet.value), true))"} //Updates the starting time label when ever the value of starting time stepper change.
    @IBAction func workHourEndStepper(_ sender: Any) {workHourEndLabel.text = "\(String(Int(workHourEndStepperOutlet.value)))\(convertDecimalHoursToString(Float(workHourEndStepperOutlet.value), true))"} //Updates the end time label when ever the value of ending time stepper change.
    @IBOutlet weak var workHourStartStepperOutlet: UIStepper! //Outlet for the starting hour stepper.
    @IBOutlet weak var workHourEndStepperOutlet: UIStepper! //Outlet for the end hour stepper.
        
//Labels
    @IBOutlet weak var workHourStartLabel: UILabel! //Label showing the selected starting time.
    @IBOutlet weak var workHourEndLabel: UILabel! //Label showing the selected end time.
    @IBOutlet weak var resultsLabel: UILabel! //Label showing the amount of hours worked.
    
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
    
//Update the results label with the amounts of hours worked, minus lunchbreak if aproppiate.
    func updateResultsLabel(){
        resultsLabel.text = "You have worked for \(Int(calculateHours())) hours\(convertDecimalHoursToString(calculateHours(), false))."
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

