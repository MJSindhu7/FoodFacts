//
//  FavoritesCell.swift
//  FoodFacts
//
//  Created by Haasi  on 11/12/20.
//  Copyright © 2020 archit. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
