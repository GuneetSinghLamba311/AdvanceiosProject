//
//  Scoreboard.swift
//  AdvanceIosFinalProject
//
//  Created by Guneet Singh Lamba on 27/07/18.
//  Copyright © 2018 Guneet Singh Lamba. All rights reserved.
//

import UIKit

class Scoreboard: UIViewController {

    // outlets
    @IBOutlet weak var sceneView: UIView!
    @IBOutlet weak var gamePlayedView: UIView!
    @IBOutlet weak var totalPointsEarnedView: UIView!
    @IBOutlet weak var scenePointsLabel: UILabel!
    @IBOutlet weak var gamesPlayedLabel: UILabel!
    @IBOutlet weak var totalPointsEarnedLabel: UILabel!
    
    // variables
    
    let scenePoints = "340"
    let gamesPlayed = "10"
    let totalPointsEarned = "4500"
     override func viewDidLoad() {
        super.viewDidLoad()
        // making view round.
        sceneView.layer.cornerRadius = sceneView.frame.height / 2
        gamePlayedView.layer.cornerRadius = gamePlayedView.frame.height / 2
        totalPointsEarnedView.layer.cornerRadius = totalPointsEarnedView.frame.height / 2
        scenePointsLabel.text = scenePoints
        gamesPlayedLabel.text = gamesPlayed
        totalPointsEarnedLabel.text = totalPointsEarned
        
    
    
    
    }



}
