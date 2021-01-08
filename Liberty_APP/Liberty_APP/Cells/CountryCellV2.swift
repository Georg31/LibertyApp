//
//  CountryCellV2.swift
//  Liberty_APP
//
//  Created by George Digmelashvili on 1/7/21.
//

import UIKit

class CountryCellV2: UITableViewCell {

    @IBOutlet weak var CountryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
