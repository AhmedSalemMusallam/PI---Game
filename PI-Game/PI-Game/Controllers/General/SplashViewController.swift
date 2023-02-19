//
//  SplashViewController.swift
//  PI-Game
//
//  Created by Ahmed Salem on 07/02/2023.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var logoIcon: UIImageView!
    @IBOutlet weak var logoCircle: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark:- fire the circle animation
        animateLogo()
        //Mark:- Fire Segue
        PerformsSplashSegue()
    }
    

    //Mark:- animation function
    private func animateLogo()
    {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            //Vertical Shaking
            UIView.animate(withDuration: 0.4, animations: {
                self.logoIcon.shake_vertical()
                
            })
            // Scaling
            UIView.animate(withDuration: 0.4, animations: {
                self.logoCircle.transform = CGAffineTransform(scaleX: 4, y: 6)
                
                })
        
        }
    }
    
    //Mark:- Perform Segue
    private func PerformsSplashSegue()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
            self.performSegue(withIdentifier: "PerformsSplashSegue", sender: nil)
        }
    }

}
