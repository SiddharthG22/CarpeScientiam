//
//  HomeTBController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/3/21.
//

import UIKit

class HomeTBController: UITabBarController {
    
    var name:String = ""
    var level:String = ""
    var userScore = Int()
    
    var filteredData:[String]!
    var bookmarks = [String]()
    
    var search:Bool = false
    var FL_Items:String = ""
    var FL_allItems:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .none
        view.frame = CGRect(x: 0, y: 0, width: 414, height: 847)
        
        guard let items = self.tabBar.items else { return }
        
        let titles = ["Home", "Saved", "Events", "Settings"]
        let images = ["house", "bookmark", "calendar", "gear"]
        
        for x in 0 ..< images.count {
            items[x].image = UIImage(systemName: images[x])
            items[x].title = String(titles[x])
        }
        
        let titleLabel1 = UILabel()
        titleLabel1.text = "Home"
        titleLabel1.font = UIFont(name: "Cinzel", size: 25.0)
        titleLabel1.textColor = .black
        titleLabel1.sizeToFit()
        navigationItem.titleView = titleLabel1
        
        self.tabBar.tintColor = UIColor(red: 0.085, green: 0.315, blue: 0.530, alpha: 1.0)
        self.tabBar.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MenuViewController
        vc.level = level
        vc.userScore = userScore
        vc.name = name
        
    }
    
}
