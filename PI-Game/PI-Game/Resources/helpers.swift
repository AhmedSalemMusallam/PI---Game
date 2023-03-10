//
//  helpers.swift
//  PI-Game
//
//  Created by Ahmed Salem on 07/02/2023.
//

import Foundation
import UIKit
extension UIView
{
    func shake_vertical(count : Float = 2,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5)
    {

        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake_vertical")
    }
    
   
    
}
