//
//  EventsCollectionViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/11/21.
//

import UIKit

class EventsCollectionViewController: UICollectionViewController {
    
    let events = ["National Convention (NJCL)", "State Convention (CAJCL)", "Carcer (Certamen)", "SCRAM (Southern CA.)", "Ludi (Northern CA.)", "ACL Institute"]
    
    let eventImages = [
        "logo1",
        "logo2",
        "logo2",
        "logo2",
        "logo2",
        "logo6"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleLabel1 = UILabel()
            
        titleLabel1.text = "Upcoming Events"
        titleLabel1.font = UIFont(name: "Cinzel", size: 25.0)
        titleLabel1.textColor = .black
        titleLabel1.textAlignment = .center
        titleLabel1.sizeToFit()
            
        navigationItem.titleView = titleLabel1
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            eventCell.createCell(with: events[indexPath.row])
            eventCell.createCellImage(with: UIImage(named: eventImages[indexPath.row])!) 
            cell = eventCell
            
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "EDViewController") as? EDViewController
        vc?.events = events[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
