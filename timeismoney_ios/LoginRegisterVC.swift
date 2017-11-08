//
//  LoginRegisterVC.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/8/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit
import ZFRippleButton

class LoginRegisterVC: UIViewController, UITextFieldDelegate {
    
    //Username Input
    @IBOutlet weak var userInput: UITextField!
    
    //Password Input
    @IBOutlet weak var passwordInput: UITextField!
    
    //Login Button
    @IBOutlet weak var loginButton: ZFRippleButton!
    
    
    //Register Button
    @IBOutlet weak var registerButton: ZFRippleButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldStyling()
        
        userInput.delegate = self;
        passwordInput.delegate = self;
        
        
        
        userInput.returnKeyType = .done
        passwordInput.returnKeyType = .done
        // Do any additional setup after loading the view.
    }
    
    
    // Manipulate the return keys for the text fields.
    func textFieldShouldReturn(_ userInput: UITextField) -> Bool {
        userInput.resignFirstResponder()
        return true
    }
    
    func textFieldStyling(){
        
   //     userInput.frame.size.height = 74.0;
     //   passwordInput.frame.size.height = 74.0;
        
    }
    
    //When login is pressed.
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        print("Logging IN!")
    
    }
    
    //When register button is pressed.
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        print("REGISTERING!")
    
    }
    

}
