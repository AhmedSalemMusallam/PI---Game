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
}
