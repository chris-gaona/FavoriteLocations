//
//  LocationDetailViewController.swift
//  FavoriteLocations
//
//  Created by Chris Gaona on 4/26/21.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: LocationDetailHeaderView!
    
    var location: Location = Location()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // Configure header view
        headerView.headerImageView.image = UIImage(named: location.image)
        headerView.nameLabel.text = location.name
        
        // TODO: heart button wire up
    }
}
