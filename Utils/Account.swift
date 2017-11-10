//
//  Account.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/9/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import Foundation
import UIKit

class Account {
    
    var tokenSettings = Token_Settings()
    
    //Log the user out.
    func logout(currentView : UIViewController){
        
        //Remove the token.
        tokenSettings.removeToken()
    
        //Push to the loading page.
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loadingVC") as! LoadingVC
        currentView.present(newViewController, animated: true, completion: nil)
        
        
    }
    
    //Get the details for a user.
    func getDetails(){
        
     //   var token = tokenSettings.getToken();
        
        
    }
    
    //Log the the user in.
    func login(username : String, password : String){
        
    }
    
}
