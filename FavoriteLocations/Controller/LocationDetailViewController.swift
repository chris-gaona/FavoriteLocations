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
        
        // Configure data source
        // Basically this is saying the tableView's dataSource & delegate is this ViewController class
        tableView.delegate = self
        tableView.dataSource = self
        
        // Remove cell separator from table
        tableView.separatorStyle = .none
    }
}

extension LocationDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LocationDetailTextCell.self), for: indexPath) as! LocationDetailTextCell
            cell.memoryLabel.text = location.memory
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
            
        }
    }
}
