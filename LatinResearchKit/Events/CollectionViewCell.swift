//
//  CollectionViewCell.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/11/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    func createCell(with eventName:String) {
        labelView.font = UIFont(name: "Cinzel", size: 13.0)
        labelView.adjustsFontForContentSizeCategory = true
        labelView.adjustsFontSizeToFitWidth = true
        labelView.text = eventName
    }
    
    func createCellImage(with eventImage:UIImage) {
        imageView.image = eventImage
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        imageView.layer.cornerRadius = 10.0
    }


}
