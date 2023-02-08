//
//  ViewController.swift
//  PI-Game
//
//  Created by Ahmed Salem on 07/02/2023.
//

import UIKit

class MainViewController: UIViewController {

    //Mark:- Pi Collection View
    @IBOutlet weak var PICollectionView: UICollectionView!
    
    //Mark:- numbers OutLets
    @IBOutlet weak var numberOneBtn: UIButton!
    @IBOutlet weak var numbertwoBtn: UIButton!
    @IBOutlet weak var numberThreeBtn: UIButton!
    @IBOutlet weak var numberFourBtn: UIButton!
    @IBOutlet weak var numberFiveBtn: UIButton!
    @IBOutlet weak var numberSixBtn: UIButton!
    @IBOutlet weak var numberSevenBtn: UIButton!
    @IBOutlet weak var numberEightBtn: UIButton!
    @IBOutlet weak var numberNineBtn: UIButton!
    @IBOutlet weak var numberZeroBtn: UIButton!
    
    //Mark:- Actions
    
    @IBAction func numberOneBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    @IBAction func numberTwoBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    @IBAction func numberThreeBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    
    @IBAction func numberFourBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    
    @IBAction func numberFiveBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    @IBAction func numberSixBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    
    @IBAction func numberSevenBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    
    @IBAction func numberEightBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    
    @IBAction func numberNineBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    @IBAction func numberZeroBtnTouchUpInsideAction(_ sender: UIButton) {
        //fire fading
        fadingEffect(sender: sender)
    }
    
    //Mark:- pi model declaration
    var PIDigitsModels = [PIDigitsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //unwraping the file string
        guard let PIDigitString : String = readPIFile() else { return }
        
        //add empty space at the begining
        PIDigitsModels.append(PIDigitsModel(digitValue: " ",digitIndex: " "))
        for (index, char) in PIDigitString.enumerated()
        {
            if index == 0 || index == 1
            {
                //filling the model with pi digits
                PIDigitsModels.append(PIDigitsModel(digitValue: String(char),digitIndex: " "))
            }else{
                //filling the model with pi digits
                PIDigitsModels.append(PIDigitsModel(digitValue: String(char),digitIndex: String(index-1)))
            }
            
        }
        
        
        //collection view delegate and datasource
        PICollectionView.delegate = self
        PICollectionView.dataSource = self
        
        //collection view Register
        PICollectionView.register(PIFractionSequenceCollectionViewCell.nib(), forCellWithReuseIdentifier: PIFractionSequenceCollectionViewCell.identifier)
       
    }

    //Mark:- fading effect function
    func fadingEffect(sender:UIButton)
    {
        sender.alpha = 0.4
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ) {
            sender.alpha = 1.0
        }
    }
}


//Mark:- Collection Delegation and DataSource confirm
extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PIDigitsModels.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = PICollectionView.dequeueReusableCell(withReuseIdentifier: PIFractionSequenceCollectionViewCell.identifier, for: indexPath) as? PIFractionSequenceCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: PIDigitsModels[indexPath.row])
        return cell
    }
    
}

//Mark:- Create layout for CollectionView


