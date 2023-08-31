//
//  ExamsCollectionViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/26/21.
//

import UIKit
import SwiftUI

class ExamsCollectionViewController: UICollectionViewController {
    
    var name:String!
    var level:String = ""
    var userScore = Int()
    
    let events = ["NLE", "NME", "NLVE", "NLCEE", "AP® Latin"]
    let eventImages = ["NLE", "NME", "NLVE", "NCEE", "APLatin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel1 = UILabel()
        
        titleLabel1.text = "Exams"
        titleLabel1.font = UIFont(name: "Cinzel", size: 25.0)
        titleLabel1.textColor = .black
        titleLabel1.sizeToFit()
        
        navigationItem.titleView = titleLabel1
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            eventCell.layer.shadowRadius = 4.0
            eventCell.layer.cornerRadius = 10.0
            eventCell.layer.borderWidth = 3.0
            eventCell.layer.borderColor = CGColor.init(red: 0.897, green: 0.899, blue: 0.917, alpha: 1.0)
            
//            eventCell.createCell2(with: events[indexPath.row])
//            eventCell.createCellImage(with: UIImage(named: eventImages[indexPath.row])!)
//            eventCell.createButton()
            
            cell = eventCell
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "TDViewController") as? TDViewController
        vc!.events = events[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
