//
//  LocationDetailTextCell.swift
//  FavoriteLocations
//
//  Created by Chris Gaona on 4/26/21.
//

import UIKit

class LocationDetailTextCell: UITableViewCell {
    
    @IBOutlet var memoryLabel: UILabel! {
        didSet {
            memoryLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
