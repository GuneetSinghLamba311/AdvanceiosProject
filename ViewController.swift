//
//  ViewController.swift
//  AdvanceIosFinalProject
//
//  Created by Guneet Singh Lamba on 26/07/18.
//  Copyright © 2018 Guneet Singh Lamba. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class ViewController: UIViewController {

    // 1. Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
   
    //2. Variables
    var deviceId:String? = ""
    var username:String? = ""
  
    var databaseReference:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // getting device unique id
      deviceId = UIDevice.current.identifierForVendor?.uuidString
      print(deviceId!)
     
        // Making Button Round
        signInButton.layer.cornerRadius = signInButton.frame.height / 2
        
        // giving reference to database
         self.databaseReference = Database.database().reference()
        }

    
    // 3. Perform action on pressing Button
    @IBAction func signInAction(_ sender: Any) {
        if userNameTextField.text == "" {
            userNameTextField.text = "Please Enter Your Name"
        }
        else {
            username = userNameTextField.text
            let data = ["uniqueId": deviceId, "username":username]
            self.databaseReference.child("Accounts").childByAutoId().setValue(data)
            performSegue(withIdentifier: "questionsPage", sender: nil)
        }
        
        
}
    
    
    
    // start timer
    
    
    
    


}

