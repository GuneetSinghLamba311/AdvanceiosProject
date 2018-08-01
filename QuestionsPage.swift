//
//  QuestionsPage.swift
//  AdvanceIosFinalProject
//
//  Created by Guneet Singh Lamba on 26/07/18.
//  Copyright © 2018 Guneet Singh Lamba. All rights reserved.
//


/*
 In this Page we will fetch the user for particular unique device id and we will display questions on this page and if he answers right question we will update the points in his child.
*/



import UIKit
import Firebase
import FirebaseDatabase
class QuestionsPage: UIViewController {

   // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timerText: UILabel!
    
   // variables.
    var databaseReference:DatabaseReference!
    var deviceId:String? = ""
    var countdownTimer: Timer!
    var totalTime = 10
    var flag = 0
    var counter = 0
    var questions = [String]()
    var answers = [String]()
    var scores = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //getting device id from device
         deviceId = UIDevice.current.identifierForVendor?.uuidString
        // create database reference
        self.databaseReference = Database.database().reference()
        
        // startTimer
        storeData()
        startTimer()
        
        
   
        // Open account for user based on unique id.
        // using observe method to get data from database.
       
        /*
      Below is the query to select the user from database where the uniqueId of device
         stored in database is equal to the uniqueid of current device.
         (select user from database where uniqueId == deviceId).
         By this we will get the name of that particular user and can apply more changes in his account.
         */
        
        // queryOrdered and queryEqual: it means search in uniqueid and get value where id is equal to deviceId.
        databaseReference.child("Accounts").queryOrdered(byChild: "uniqueId").queryEqual(toValue: deviceId).observeSingleEvent(of: .value, with: { (snapShot) in
            
            if let Dict = snapShot.value as? [String:AnyObject]{
                
                for each in Dict{
                    let key  = each.key
                    let name = each.value["username"] as! String
                    print(key)
                    print(name)
                    self.titleLabel.text = "Welcome \(name) to Let's play game"
                }
            }
        })
        
}
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime() {
        
        if(totalTime == 10 && flag == 0){
          
            flag = 1
        }
        
        if(totalTime != 10){
            timerText.text = "0\(totalTime % 60)"
        }else{
            timerText.text = "\(totalTime % 60)"
        }
        
        
        
        if totalTime != 0 {
            totalTime -= 1
        }
        else {
            
            endTimer()
            totalTime = 10
            
            if(self.counter == 4) {
                
                // self.counter = self.questions.count
                self.timerText.text = "GAME OVER!!!"
                
            }
                else{
                startTimer()
                counter += 1
            }
        }
        
    }
        func endTimer() {
            countdownTimer.invalidate()
            
}
    func storeData() {
        
      
        self.databaseReference.child("Questions").observe(.childAdded, with: {(snapshot) in
            
            let data = snapshot.value as! NSDictionary
            print(data)
            
            let answers = data["correct"] as! String
            
            self.answers.append(answers)
            
        })
    }
    
    @IBAction func selectA(_ sender: Any) {
        if(answers[counter] == "A") {
            print("hello")
            print(answers)
            scores += 5
        }
        else {
            print("bye")
        }
        
    }
    
    
    @IBAction func selectB(_ sender: Any) {
        if(answers[counter] == "B") {
            print("hello")
            scores += 5
        }
        else {
            print("bye")
        }
    }
    
    @IBAction func selectC(_ sender: Any) {
        if(answers[counter] == "C") {
            print("hello")
            scores += 5
        }
        else {
            print("bye")
        }
    }
    
    @IBAction func selectD(_ sender: Any) {
        if(answers[counter] == "D") {
            print("hello")
            scores += 5
        }
        else {
            print("bye")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
