//
//  FavoriteTableViewController.swift
//  FavoriteLocations
//
//  Created by Chris Gaona on 4/21/21.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    lazy var dataSource = configureDataSource()
    
    enum Section {
        case all
    }
    
    var locations = ["Rome", "Arizona", "Half Moon Bay", "South Africa", "Maui", "Yellowstone"]
    var images = ["rome", "arizona", "hmb", "south-africa", "maui", "yellowstone"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(locations, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let cellIdentifier = "tablecell"
        
        let dataSource = UITableViewDiffableDataSource<Section, String> (
            tableView: tableView,
            cellProvider: {tableView, indexPath, location in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FavoriteTableViewCell
            
            cell.locationLabel.text = location
            cell.thumbnailImageView.image = UIImage(named: self.images[indexPath.row])
                
            return cell
        })
        return dataSource
    }
}
