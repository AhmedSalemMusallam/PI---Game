//
//  GameFinisedViewController.swift
//  PI-Game
//
//  Created by Ahmed Salem on 11/02/2023.
//

import UIKit

class GameFinisedViewController: UIViewController {

   
    //MArk:- Outlets
    @IBOutlet weak var scoreValue: UILabel!
    
    @IBOutlet weak var bestScoreValue: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var jumpToButton: UIButton!

    //Mark:- Actions
    @IBAction func restartAction(_ sender: Any) {
        //dismiss the view controller
        self.dismiss(animated: true, completion: {
            //reload collection view data source
            
            
        })
        
    }
    
  
    
    @IBAction func continueAction(_ sender: Any) {
        print("Continue Button")
    }
    @IBAction func jumpTo(_ sender: Any) {
        print("jumpTo Button")
    }
    
    
    
    
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
        
        //Mark:- Setting Values to the lables Best Score
        bestScoreValue.text = "\(String(SceneDelegate.userData.integer(forKey: "BestScore"))) digits"
        
        //To make the view controller undismissable
        self.isModalInPresentation = true
        
        //Presenting the view controller as a sheet
        if let sheet = self.sheetPresentationController{

            sheet.preferredCornerRadius = 40

            sheet.detents = [.custom(resolver: {
                context in
                0.6 * context.maximumDetentValue
            }), .large()]

        }
        
    }
    

    

}
