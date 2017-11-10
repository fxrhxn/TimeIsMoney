//
//  FlyingLabels.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/10/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit


class FlyingLabels: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet var whole: UIView!
    
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    
    var secondprice = 0.05

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Change the label text.
        testLabel.text = "-$\(secondprice * 5)"
        testLabel.textColor = UIColor.white;
        
        
        scheduledTimerWithTimeInterval()
        // Do any additional setup after loading the view.
        
  
        
        
    }

    @IBAction func moveButton(_ sender: Any) {
        
        //Move the button in a random location.
        moveButton(btn : testButton)
    
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        
    // Find the button's width and height
    let labelWidth = self.testLabel.frame.width
    let labelHeight = self.testLabel.frame.height

    // Find the width and height of the enclosing view
    let viewWidth = self.testLabel.superview!.bounds.width
    let viewHeight = self.testLabel.superview!.bounds.height / 2

    // Compute width and height of the area to contain the button's center
    let xwidth = viewWidth - labelWidth
    let yheight = viewHeight - labelHeight

    // Generate a random x and y offset
    let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
    let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))

    // Offset the button's center by the random offsets.
        self.testLabel.center.x = xoffset + labelWidth / 2
        self.testLabel.center.y = yoffset + labelHeight / 2

        
        
    }
    
    //Function that shows the label in a random location.
    @objc func showLabel(){
        
        self.testLabel.textColor = UIColor.red;
        
        // Find the button's width and height
        let labelWidth = self.testLabel.frame.width
        let labelHeight = self.testLabel.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = self.testLabel.superview!.bounds.width
        let viewHeight = self.testLabel.superview!.bounds.height / 2
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - labelWidth
        let yheight = viewHeight - labelHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        self.testLabel.center.x = xoffset + labelWidth / 2
        self.testLabel.center.y = yoffset + labelHeight / 2
        
        //Animate the text label away
        UIView.animate(withDuration: 2.3) {
            
            //    label = self.view.frame.size.width / 2
            
            self.testLabel.center.y -= 500;
            
        }

    }
    
    
    //Moves the label away from the screen.
    func moveLabel(){
        
    }
    
    func moveButton(btn : UIButton){
     
//        // Find the button's width and height
//        let buttonWidth = btn.frame.width
//        let buttonHeight = btn.frame.height
//
//        // Find the width and height of the enclosing view
//        let viewWidth = btn.superview!.bounds.width
//        let viewHeight = btn.superview!.bounds.height / 2
//
//        // Compute width and height of the area to contain the button's center
//        let xwidth = viewWidth - buttonWidth
//        let yheight = viewHeight - buttonHeight
//
//        // Generate a random x and y offset
//        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
//        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
//
//        // Offset the button's center by the random offsets.
//        btn.center.x = xoffset + buttonWidth / 2
//        btn.center.y = yoffset + buttonHeight / 2
//
        
        
        UIView.animate(withDuration: 1.0) {
            
            //    label = self.view.frame.size.width / 2
            
            self.testLabel.center.y -= 500;
            
        }
        
        

    
    }
    
    func createNewLabel(){
        
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 284)
        label.textAlignment = NSTextAlignment.center
        label.text = "I'am a test label"
        
    
        self.view.addSubview(label)
        
  
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.showLabel), userInfo: nil, repeats: true)
    }
    

    
    
}
