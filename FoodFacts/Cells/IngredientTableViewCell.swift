//
//  IngredientTableViewCell.swift
//  FoodFacts
//
//  Created by Sathya Sri Pasham on 11/15/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientValue: UILabel!
    @IBOutlet weak var ingredientName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
