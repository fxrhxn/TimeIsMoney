//
//  LoadingVC.swift
//  timeismoney_ios
//
//  Created by Farhan Rahman on 11/9/17.
//  Copyright © 2017 Farhan Rahman. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {
    
  
   let defaults = UserDefaults.standard
    var tokenSettings = Token_Settings()
    
    
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        
    //    tokenSettings.removeToken()
        
      //  tokenSettings.saveToken(token: "ha")
        
        
        //Check if a token is saved.
        if(tokenSettings.hasToken()){

            //Push to the main app.
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainVC") as! MainVC
            self.present(newViewController, animated: true, completion: nil)

        }else{

            //Push to the login page.
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginRegisterVC") as! LoginRegisterVC
            self.present(newViewController, animated: true, completion: nil)
        }
  
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
