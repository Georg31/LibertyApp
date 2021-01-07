//
//  CountryCell.swift
//  Liberty_APP
//
//  Created by George Digmelashvili on 1/7/21.
//

import UIKit

class CountryCell: UICollectionViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    
    var country: String!{
        didSet{
            countryLabel.text = country
        }
    }
}
