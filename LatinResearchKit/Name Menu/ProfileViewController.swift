//
//  ProfileViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var name:String!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad()  {
        super.viewDidLoad()
        imageView.image = generatedQRCode(userName:name)
        
        let titleLabel1 = UILabel()
        titleLabel1.text = "AmiciScan"
        titleLabel1.font = UIFont(name: "Cinzel", size: 25.0)
        titleLabel1.textColor = .black
        titleLabel1.sizeToFit()
        navigationItem.titleView = titleLabel1
    }
    
    func generatedQRCode(userName:String) -> UIImage? {
        let data = userName.data(using: .ascii, allowLossyConversion: false)
            
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 50, y: 50)
            if let scaledImg = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: scaledImg)
            }
        }
        return nil
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
