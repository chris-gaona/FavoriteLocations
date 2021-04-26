//
//  FavoriteTableViewController.swift
//  FavoriteLocations
//
//  Created by Chris Gaona on 4/21/21.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    /* Table Implementation */
    lazy var dataSource = configureDataSource()
    
    var locations: [Location] = [
        Location(name: "Rome", memory: "Oh how the mighty fall in the gladiator ring!", image: "rome"),
        Location(name: "Arizona", memory: "The heat of the son makes my skin bubble like hot oil", image: "arizona"),
        Location(name: "Half Moon Bay", memory: "For such an amazing beach, why can't you be more sunny?", image: "hmb"),
        Location(name: "South Africa", memory: "How I wish to go back & explore more!", image: "south-africa"),
        Location(name: "Maui", memory: "My home away from home in the tropical paradise", image: "maui"),
        Location(name: "Yellowstone", memory: "Wolves, bears, & bison oh my!", image: "yellowstone"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Location>()
        snapshot.appendSections([.all])
        snapshot.appendItems(locations, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, Location> {
        let cellIdentifier = "tablecell"
        
        let dataSource = LocationDiffableDataSource (
            tableView: tableView,
            cellProvider: {tableView, indexPath, location in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FavoriteTableViewCell
            
                cell.locationLabel.text = location.name
                cell.memoryLabel.text = location.memory
                cell.thumbnailImageView.image = UIImage(named: location.image)
                
            return cell
        })
        return dataSource
    }
    /* End Table Implementation */
    
    /* Row did select handling */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: "Traveling!", message: "Would you like to see more?", preferredStyle: .actionSheet)
        
        // Handle opening popovers on tablets
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let moreAction = UIAlertAction(title: "Show more!", style: .default) { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry this feature is not available yet. Please try later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        optionMenu.addAction(moreAction)
        
        // Display the menu
        self.present(optionMenu, animated: true, completion: nil)
        
        // Deselect the row
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let location = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        
        // Add to list action
        let addToListAction = UIContextualAction(style: .normal, title: "") {
            (action, sourceView, completionHandler) in
            
            let addToListTitle = location.name
            let addToListAlert = UIAlertController(title: addToListTitle, message: "Sorry this feature is not available yet. Please try later.", preferredStyle: .alert)
            addToListAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(addToListAlert, animated: true, completion: nil)
            
            completionHandler(true)
        }
        
        // Share action
        let shareAction = UIContextualAction(style: .normal, title: "") {
            (action, sourceView, completionHandler) in
            
            let defaultText = "I want to go to " + location.name
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: location.image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            // Add popover support for ipad & ipod touch
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        // Setting colors & icons for the swipeable actions
        addToListAction.backgroundColor = UIColor.systemGreen
        addToListAction.image = UIImage(systemName: "plus.circle.fill")
        
        shareAction.backgroundColor = UIColor.systemOrange
        shareAction.image = UIImage(systemName: "square.and.arrow.up.fill")
        
        // Configure actions a swipeable actions
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [shareAction, addToListAction])
        
        return swipeConfiguration
    }
}
