//
//  AddViewController.swift
//  Nibm Event
//
//  Created by Supun Srilal on 2/29/20.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        
        ref?.child("Posts").childByAutoId().setValue(text.text)
               let alert = UIAlertController(title: "Alert", message: "Event is added", preferredStyle: UIAlertController.Style.alert)

               // add an action (button)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

               // show the alert
               self.present(alert, animated: true, completion: nil)
               
    }
    
    
}
