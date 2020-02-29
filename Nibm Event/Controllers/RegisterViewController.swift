//
//  RegisterViewController.swift
//  Nibm Event
//
//  Created by Supun Srilal on 2/29/20.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailUser: UITextField!
    
    @IBOutlet weak var pwdUser: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goHome(_ sender: UIButton) {
        
        
        if let email = pwdUser.text, let password = pwdUser.text{
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error{
                print(e.localizedDescription)
            }else{
                self.performSegue(withIdentifier: "RegisterToHome", sender: self)
            }
            }
            
        }
    }
    
}
