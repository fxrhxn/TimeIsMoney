//
//  Token_Settings.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/9/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import Foundation

class Token_Settings {
    
    let userdefaults = UserDefaults.standard

    //Check if a token is saved in the account.
    func hasToken() -> Bool{
        
        //Check if there is a token.
        if let token = userdefaults.string(forKey: "token"){
            return true
        } else {
            return false
        }
        
        
    }
    
    //Remove the token.
    func removeToken(){
        
        //Remove the token.
        userdefaults.removeObject(forKey: "token")
        
    }
    
    //Save a new token.
    func saveToken(token : String){
        
        //Set a new token in the user defaults.
        userdefaults.set(token, forKey: "token")
        
    }
    
}
