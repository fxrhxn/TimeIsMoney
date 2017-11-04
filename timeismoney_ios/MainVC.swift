//
//  ViewController.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/4/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit


// Setting icon to bar button item
//barButtonItem.setIcon(icon: .ionicons(.iosFootball), iconSize: 30)


class MainVC: UIViewController {
    
    var testing : String?
    
    /* Deduction amount for each second. */
    @IBOutlet weak var deductionAmount: UILabel!
    
    /* Number of hours for timing. */
    @IBOutlet weak var oneHour: UILabel!
    @IBOutlet weak var twoHour: UILabel!
    @IBOutlet weak var threeHour: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Enable Touch ;)
        enableTouch();
        
        

        oneHour.textAlignment = .center
        oneHour.layer.borderColor = UIColor.red.cgColor;
        oneHour.layer.borderWidth = 1.8;
    
        //Get the tap data ayeee
        let tap = UITapGestureRecognizer(target: self, action: #selector(MainVC.tapFunction))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(MainVC.tapFunction))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(MainVC.tapFunction))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(MainVC.tapFunction))
        
        //Add touch recognization to all of the labels.
        oneHour.addGestureRecognizer(tap)
        twoHour.addGestureRecognizer(tap2)
        threeHour.addGestureRecognizer(tap3)
        deductionAmount.addGestureRecognizer(tap4)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    //Function for tapping motherfuckers ;)
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
        print(sender.view!.tag)
        //This means the deduction amount is clicked.
        if(sender.view!.tag == 0){
            
            print("Changing the price?")
        
        }
        
        //First Hour is selected.
        if(sender.view!.tag == 1){
            print("FIRST HOUR BITCH")
        }
        
        //Second hour is selected.
        if(sender.view!.tag == 2){
            print("SECOND HOUR BITCH")
        }
        
        //Third hour is selected.
        if(sender.view!.tag == 3){
            print("THIRD HOUR BITCH")
        }
        
    }
    
    
    //Function that enables touch.
    func enableTouch(){
        self.oneHour.isUserInteractionEnabled = true;
        self.twoHour.isUserInteractionEnabled = true;
        self.threeHour.isUserInteractionEnabled = true;
        self.deductionAmount.isUserInteractionEnabled = true;
    }

    
    //When the start button is clicked.
    @IBAction func startButton(_ sender: Any) {
        
    }
    
}

