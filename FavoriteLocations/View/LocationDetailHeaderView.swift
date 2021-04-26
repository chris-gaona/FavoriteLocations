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
            
            if let customFont = UIFont(name: "Nunito-Bold", size: 40.0) {
                nameLabel.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont)
            }
        }
    }
    @IBOutlet var heartButton: UIButton!

}
