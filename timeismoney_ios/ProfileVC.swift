//
//  ProfileVC.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/9/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //Label for the username.
    @IBOutlet weak var usernameLabel: UILabel!
    
    //Label for the date.
    @IBOutlet weak var dateLabel: UILabel!
    
     

    var accountActions = Account();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }


    @IBAction func profileClicked(_ sender: UIBarButtonItem) {
    }
    
    //When the logout button is clicked. 
    @IBAction func logoutClicked(_ sender: Any) {
        
        accountActions.logout(currentView : self)
        
    }
    
    
    

}
