//
//  QuizViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/9/21.
//

import UIKit

class QuizViewController: UIViewController {
    
    var name:String = ""
    var level:String = ""
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var image5: UIImageView!
    
    var topics = ["History", "Geography", "Mythology", "Grammar", "Culture"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstButton.titleLabel?.textAlignment = .right
        secondButton.titleLabel?.textAlignment = .right
        thirdButton.titleLabel?.textAlignment = .right
        fourthButton.titleLabel?.textAlignment = .right
        fifthButton.titleLabel?.textAlignment = .right
        

//        image1.layer.cornerRadius = 10.0
//        image1.layer.borderWidth = 1.0
//        image1.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
//
//        image2.layer.cornerRadius = 10.0
//        image2.layer.borderWidth = 1.0
//        image2.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
//
//        image3.layer.cornerRadius = 10.0
//        image3.layer.borderWidth = 1.0
//        image3.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
//
//        image4.layer.cornerRadius = 10.0
//        image4.layer.borderWidth = 1.0
//        image4.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
//
//        image5.layer.cornerRadius = 10.0
//        image5.layer.borderWidth = 1.0
//        image5.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
        
        firstButton.layer.cornerRadius = 10.0
        firstButton.titleLabel?.textAlignment = .right
        
        firstButton.layer.borderWidth = 1.0
        firstButton.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor

        secondButton.layer.cornerRadius = 10.0
        secondButton.layer.borderWidth = 1.0
        secondButton.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
        
        thirdButton.layer.cornerRadius = 10.0
        thirdButton.layer.borderWidth = 1.0
        thirdButton.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
        
        fourthButton.layer.cornerRadius = 10.0
        fourthButton.layer.borderWidth = 1.0
        fourthButton.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
        
        fifthButton.layer.cornerRadius = 10.0
        fifthButton.layer.borderWidth = 1.0
        fifthButton.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
        
        let titleLabel1 = UILabel()
        
        titleLabel1.text = "Topics"
        titleLabel1.font = UIFont(name: "Cinzel", size: 25.0)
        titleLabel1.textColor = .black
        titleLabel1.sizeToFit()
        
        navigationItem.titleView = titleLabel1
    }
    
    @IBAction func topicTableSegue(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "TopicsTableViewController") as? TopicsTableViewController

        if sender.titleLabel?.text == "          History" {
            vc!.topic = "History"
        } else if sender.titleLabel?.text == "          Geography" {
            vc!.topic = "Geography"
        } else if sender.titleLabel?.text == "          Mythology" {
            vc!.topic = "Mythology"
        } else if sender.titleLabel?.text == "          Grammar" {
            vc!.topic = "Grammar"
        } else if sender.titleLabel?.text == "          Culture" {
            vc!.topic = "Culture"
        }
        
        vc!.name = name
        vc!.level = level
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! TopicsTableViewController
//        vc.level = level
//        vc.name = name
//    }

}
