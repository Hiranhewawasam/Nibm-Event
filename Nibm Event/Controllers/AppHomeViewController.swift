//
//  AppHomeViewController.swift
//  Nibm Event
//
//  Created by Supun Srilal on 2/29/20.
//  Copyright © 2020 Macbook Pro. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AppHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    var databaseHandel: DatabaseHandle!
    
    var postData = [String]()
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
          let pdata = postData[indexPath.row]
          let alertController = UIAlertController(title: "Example", message: "example", preferredStyle: .alert)
          
          let updateAction = UIAlertAction(title: "Update", style: .default){(_) in
              
          }
          let deleteAction = UIAlertAction(title: "Delete", style: .default){(_) in
                     
                 }
          
      
          
          alertController.addAction(updateAction)
          alertController.addAction(deleteAction)
          
          present(alertController, animated:true, completion: nil)
          
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         ref = Database.database().reference()
               title = "Home"
               navigationItem.hidesBackButton = true
               tableView.delegate = self
               tableView.dataSource = self
        
        databaseHandel = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
                   
                   let post = snapshot.value as? String
                   if let actualPost = post {
                   
                   self.postData.append(actualPost)
                       self.tableView.reloadData()
                   }
               })
        
    }
    

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
     return postData.count
 }
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
     cell?.textLabel?.text = postData[indexPath.row]
     return cell!
 }
    
    
    @IBAction func Add(_ sender: UIBarButtonItem) {
          self.performSegue(withIdentifier: "HometoEvent", sender: self)
        
    }
    
}
