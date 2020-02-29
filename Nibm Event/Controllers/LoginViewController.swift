//
//  LoginViewController.swift
//  Nibm Event
//
//  Created by Supun Srilal on 2/29/20.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var uname: UITextField!
    @IBOutlet weak var pwd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    

    @IBAction func log(_ sender: UIButton) {
        
        if let email = uname.text, let password = pwd.text
        {
            
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                  
                if let e = error{
                    print(e.localizedDescription)
                }else{
                    
                 self.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
                
                   }
        }
    }
    

}
