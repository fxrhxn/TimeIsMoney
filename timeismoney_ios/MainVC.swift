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


class MainVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    var testing : String?
    var current_hour = 2
    var current_amount = "0.05"
    
    //Data that we will send to the picker view.
    var picker_data = ["0.05", "0.10", "0.25", "1.00", "5.00"]
    
    /* Deduction amount for each second. */
    @IBOutlet weak var deductionAmount: UILabel!
    
    /* Number of hours for timing. */
    @IBOutlet weak var oneHour: UILabel!
    @IBOutlet weak var twoHour: UILabel!
    @IBOutlet weak var threeHour: UILabel!
    
    //The picker view to select the current amount.
    @IBOutlet var pickerView: UIView!
    @IBOutlet weak var pricePicker: UIPickerView!
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    func numberOfComponents(in pricePicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pricePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker_data.count;
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //Update the deduction amount with the new labeled text.
        var label_text = "$\(picker_data[row]) per second"
        deductionAmount.text = label_text
        
        current_amount = picker_data[row]
        
        
        return picker_data[row]
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        self.blurEffect.isHidden = true
        //Setup the things needed for the picker view.
        self.pricePicker.dataSource = self
        self.pricePicker.delegate = self
        
        //Enable Touch ;)
        enableTouch();
        
        //Select the second label
        newBorder(labl: twoHour)
        
        
        oneHour.textAlignment = .center
        oneHour.layer.borderWidth = 1.8;
        twoHour.textAlignment = .center
        twoHour.layer.borderWidth = 1.8
        threeHour.textAlignment = .center
        threeHour.layer.borderWidth = 1.8
        
        
        
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
        
        
        //This means the deduction amount is clicked.
        if(sender.view!.tag == 0){
            
            
            //Show a subview that has a number picker.
            show_picker()
            
        }
        
        //First Hour is selected.
        if(sender.view!.tag == 1){
            
            newBorder(labl : oneHour)
            current_hour = 1;
            
        }
        
        //Second hour is selected.
        if(sender.view!.tag == 2){
            
            newBorder(labl : twoHour)
            current_hour = 2;
        }
        
        //Third hour is selected.
        if(sender.view!.tag == 3){
            
            newBorder(labl : threeHour)
            current_hour = 3;
            
        }
        
       
    }
    
    
    //Function that enables touch.
    func enableTouch(){
        self.oneHour.isUserInteractionEnabled = true;
        self.twoHour.isUserInteractionEnabled = true;
        self.threeHour.isUserInteractionEnabled = true;
        self.deductionAmount.isUserInteractionEnabled = true;
    }
    
    
    // Gives a new border to a label.
    func newBorder(labl : UILabel){
        clearAllBorders()
        labl.layer.borderColor = UIColor.red.cgColor
    }
    
    //Function that clears the borders for the hour labels.
    func clearAllBorders(){
        oneHour.layer.borderColor = UIColor.white.cgColor;
        twoHour.layer.borderColor = UIColor.white.cgColor;
        threeHour.layer.borderColor = UIColor.white.cgColor;
    }
    
    //Function for the animation that gives a animated popover.
    func show_picker(){
        
        //Add the video view.
        self.view.addSubview(pickerView)
        pickerView.center = self.view.center
        
        self.blurEffect.isHidden = false
        //Stylistic changes to the video view.
        pickerView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        pickerView.alpha = 0
        
        //Animation so shit looks cool.
        UIView.animate(withDuration: 0.4) {
            self.pickerView.alpha = 1
            self.pickerView.transform = CGAffineTransform.identity
        }
        
    }
    
    
    //Function that hides the picker view.
    func hidePicker(){
       
        UIView.animate(withDuration: 0.3, animations: {
            self.pickerView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.pickerView.alpha = 0
            
            self.blurEffect.isHidden = true
            
        }) { (success:Bool) in
            self.pickerView.removeFromSuperview()
        }
    
    }
    
    

    
    //When the start button is clicked.
    @IBAction func startButton(_ sender: Any) {
        
        print(current_hour)
        print(current_amount)
        
        //Push to the login page.
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "timerActiveVC") as! TimerActiveVC
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
    
    //Select a new price yeah.
    @IBAction func selectPrice(_ sender: Any) {
        
        //Hide the picker.
        hidePicker();
        
    }
    
    //When the profile button is clicked.
    @IBAction func profileClicked(_ sender: Any) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "profileVC") as! ProfileVC
        self.present(newViewController, animated: true, completion: nil)
        
        
    }
    
}

