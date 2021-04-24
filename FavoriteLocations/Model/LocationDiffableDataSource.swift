//
//  LocationDiffableDataSource.swift
//  FavoriteLocations
//
//  Created by Chris Gaona on 4/24/21.
//

import UIKit

enum Section {
    case all
}

class LocationDiffableDataSource: UITableViewDiffableDataSource<Section, Location> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
