//
//  TimerActiveVC.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/6/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit
import SRCountdownTimer

class TimerActiveVC: UIViewController {
    
    //The countdown timer.
    @IBOutlet weak var countdownTimer: SRCountdownTimer!
    
    //The stop button.
    @IBOutlet weak var stopButton: UIButton!
    
    //Total Loss Label
    @IBOutlet weak var totalLoss: UILabel!


    
    //Deduction Price
    var deductionPrice = 0.05;
    
    //Current Time. (Returned as seconds.)
    var fullTime = 55;
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Total Loss of the price.
        var total_loss = Double(fullTime) * deductionPrice
        
        
        
        
      totalLoss.text = "Total Loss: \(total_loss)"
        
        //Function that styles the button.
        stopButtonStyling();
        
        //Function that styles the timer
        timerStyling();
        
    
    }


    //When the stop button is clicked.
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    
    //Function that styles the button.
    func stopButtonStyling(){
        stopButton.backgroundColor = UIColor.white;
        stopButton.layer.borderColor = UIColor.red.cgColor;
        stopButton.layer.borderWidth = 4
        stopButton.setTitleColor(.red, for: .normal)
    }
    
    //Styling for the timer.
    func timerStyling(){
        countdownTimer.labelFont = UIFont(name: "HelveticaNeue-Light", size: 50.0)
        countdownTimer.labelTextColor = UIColor.red
        countdownTimer.timerFinishingText = "End"
        countdownTimer.lineWidth = 4
        countdownTimer.start(beginingValue: 35, interval: 1)
    }
    
}
