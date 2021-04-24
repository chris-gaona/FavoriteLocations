//
//  FavoriteTableViewCell.swift
//  FavoriteLocations
//
//  Created by Chris Gaona on 4/21/21.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set the cell's tint color for the smiley
        self.tintColor = .darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // The following is an alernative approach besides Interface Builder to add rounded corners to an image
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = 20.0
            thumbnailImageView.clipsToBounds = true
        }
    }
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var memoryLabel: UILabel!
}
