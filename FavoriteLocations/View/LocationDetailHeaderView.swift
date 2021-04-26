//
//  LocationDetailHeaderView.swift
//  FavoriteLocations
//
//  Created by Chris Gaona on 4/26/21.
//

import UIKit

class LocationDetailHeaderView: UIView {

    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var heartButton: UIButton!

}
