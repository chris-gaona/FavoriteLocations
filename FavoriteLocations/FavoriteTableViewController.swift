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
    var memories = ["Oh how the mighty fall in the gladiator ring!", "The heat of the son makes my skin bubble like hot oil", "For such an amazing beach, why can't you be more sunny?", "How I wish to go back & explore more!", "My home away from home in the tropical paradise", "Wolves, bears, & bison oh my!"]
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
            cell.memoryLabel.text = self.memories[indexPath.row]
            cell.thumbnailImageView.image = UIImage(named: self.images[indexPath.row])
                
            return cell
        })
        return dataSource
    }
}
