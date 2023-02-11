//
//  GameFinisedViewController.swift
//  PI-Game
//
//  Created by Ahmed Salem on 11/02/2023.
//

import UIKit

class GameFinisedViewController: UIViewController {

    @IBOutlet weak var scoreValue: UILabel!
    
    @IBOutlet weak var bestScoreValue: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var jumpToButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Mark:- coloring the view background
        view.backgroundColor = UIColor(named: "Light-Color")
        
        //Mark:- styling buttons
        restartButton.layer.cornerRadius = 5
        continueButton.layer.cornerRadius = 5
        jumpToButton.layer.cornerRadius = 5
        
        //Mark:- Setting Values to the lables
        scoreValue.text = MainViewController.currentScore
    }
    

    

}
