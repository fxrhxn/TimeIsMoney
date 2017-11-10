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
    
    //The timer to run yuh.
    var timer = Timer();
    
    //The countdown timer.
    @IBOutlet weak var countdownTimer: SRCountdownTimer!
    
    //The stop button.
    @IBOutlet weak var stopButton: UIButton!
    
    //Total Loss Label
    @IBOutlet weak var totalLoss: UILabel!
    
    //Animation label that will be shown every 5 seconds.
    @IBOutlet weak var animationLabel: UILabel!
    
    //Label that shows the current loss.
    @IBOutlet weak var lossLabel: UILabel!
    
    //Deduction Price
    var deductionPrice = 0.05;
    
    //Current Time. (Returned as seconds.)
    var fullTime = 55;
    
    //Loss at the current time.
    var currentLoss = 0.0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Total Loss of the price.
        var total_loss = Double(fullTime) * deductionPrice
        
        //Set some new text for the total loss.
        totalLoss.text = "Total Loss: \(total_loss)"
        
        //Make the animation label have the deduction price every five seconds.
        animationLabel.text = "$\(deductionPrice * 5)"
        
        //Function that styles the button.
        stopButtonStyling();
        
        //Function that styles the timer
        timerStart();
        
    
    }


    //When the stop button is clicked.
    @IBAction func stopButtonClicked(_ sender: Any) {
    }
    
    
    //When the profile button is clicked. 
    @IBAction func profileButtonClicked(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "profileVC") as! ProfileVC
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    
    //Function that styles the button.
    func stopButtonStyling(){
        stopButton.backgroundColor = UIColor.white;
        stopButton.layer.borderColor = UIColor.red.cgColor;
        stopButton.layer.borderWidth = 4
        stopButton.setTitleColor(.red, for: .normal)
    }
    
    //Styling for the timer.
    func timerStart(){
        countdownTimer.labelFont = UIFont(name: "HelveticaNeue-Light", size: 50.0)
        countdownTimer.labelTextColor = UIColor.red
        countdownTimer.timerFinishingText = "End"
        countdownTimer.lineWidth = 4
        countdownTimer.start(beginingValue: fullTime, interval: 1)
        
        //Start the animations for the lols.
        scheduledTimerWithTimeInterval()
        
    }
    
    
    //Function that shows the label in a random location.
    @objc func showLabel(){
        
        self.animationLabel.textColor = UIColor.red;
        
        // Find the button's width and height
        let labelWidth = self.animationLabel.frame.width
        let labelHeight = self.animationLabel.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = self.animationLabel.superview!.bounds.width
        let viewHeight = self.animationLabel.superview!.bounds.height / 2
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - labelWidth
        let yheight = viewHeight - labelHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        self.animationLabel.center.x = xoffset + labelWidth / 2
        self.animationLabel.center.y = yoffset + labelHeight / 2
        
        currentLoss = currentLoss + deductionPrice * 5.0
        
        self.lossLabel.text = "Current Loss: \(currentLoss)"
        
        //Animate the text label away
        UIView.animate(withDuration: 2.3) {
            
            //    label = self.view.frame.size.width / 2
            
            self.animationLabel.center.y -= 500;
            
        }
        
    }
    
    func scheduledTimerWithTimeInterval(){
        
        
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 9, target: self, selector: #selector(self.showLabel), userInfo: nil, repeats: true)
        
    }
    
    
    
    
}
