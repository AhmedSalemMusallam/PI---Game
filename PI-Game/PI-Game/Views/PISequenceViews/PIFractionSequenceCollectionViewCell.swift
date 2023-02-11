//
//  PIFractionSequenceCollectionViewCell.swift
//  PI-Game
//
//  Created by Ahmed Salem on 07/02/2023.
//

import UIKit

class PIFractionSequenceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fractionNumber: UILabel!
    @IBOutlet weak var fractionNumberingLable: UILabel!
    static let identifier = "PIFractionSequenceCollectionViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "PIFractionSequenceCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fractionNumber.font = UIFont(name:"HelveticaNeue-Bold", size: 50.0)
        fractionNumberingLable.font = UIFont(name:"HelveticaNeue-Bold", size: 14.0)
    }

    public func configure(with model: PIDigitsModel)
    {
        self.fractionNumber.text = model.digitValue
        self.fractionNumberingLable.text = model.digitIndex
    }
    
    func updateView(index:Int)
    {
        if index == 0 || index == 1 || index == 2
        {

        }else{
            if MainViewController.userChoices.count != 0 && MainViewController.userChoices.count > index - 3
            {
                self.fractionNumber.text = String(MainViewController.userChoices[index-3] ?? 0)
            }
            
        }
    }
    
    //Mark:- fading effect collection view cell
    func cellFadingEffect(index:Int)
    {
        if(index-2 == MainViewController.userChoices.count)
        {
            self.fractionNumber.alpha = 0.8
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
                self.fractionNumber.alpha = 1.0
            }
        }
    }
    
    //Mark:- color the last element in case of error choice
    func coloringLastElement(index:Int)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            self.fractionNumber.textColor = UIColor(named: "Red-Color")
        }
        
    }
    //Mark:- color the elements with the default color
    func coloringElements(index:Int)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            self.fractionNumber.textColor = UIColor(named: "Dark-Color")
        }
        
    }
    //Mark:- coloring the number sequence
    func coloringTheNumbersSequence(index: Int)
    {
        if index == 2{
            self.coloringElements(index: index)
        }else if index == MainViewController.userChoices.count+2
        {
            //unwraping the file string
            guard let PIDigitString : String = OfflineServices.PIDigits else { return }
            
            let PIDigitCharacters = Array(PIDigitString)
            guard let currentUserChoice = MainViewController.userChoices[index-3] else { return }
            
            if String(currentUserChoice) != String(PIDigitCharacters[index-1])
            {
                //fire score custom modal
                MainViewController.flag = true
                
                self.coloringLastElement(index: index)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
                    self.fractionNumber.text = String(PIDigitCharacters[index-1])
                }
                
                
                self.fireErrorEvent()
                MainViewController.currentScore = " \(MainViewController.userChoices.count) digits in \(MainViewController.globalTimeString)"
                // fill the sequence with the correct numbers
                
            }else{
                self.coloringElements(index: index)
            }
            
            
        }else{
            self.coloringElements(index: index)
        }
    }
    
    
    //Mark:- Error Event
    func fireErrorEvent()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
            self.fractionNumber.textColor = UIColor(named: "Dark-Color")
        }
        
    }
    
    
}
