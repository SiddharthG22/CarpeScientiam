//
//  MenuViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/6/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    var name:String!
    var level:String = ""
    var userScore = Int()
    
    @IBOutlet weak var roundedButton1: UIButton!
    @IBOutlet weak var roundedButton2: UIButton!
    @IBOutlet weak var roundedButton3: UIButton!
    @IBOutlet weak var roundedButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundedButton1.layer.cornerRadius = 10.0
        roundedButton2.layer.cornerRadius = 10.0
        roundedButton3.layer.cornerRadius = 10.0
        roundedButton4.layer.cornerRadius = 10.0
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "prepSegue" {
            let vc = segue.destination as! ExamsCollectionViewController
            vc.level = level
            vc.userScore = userScore
        } else if segue.identifier == "quizSegue" {
            let vc = segue.destination as! DiagnosticTableViewController
            vc.level = level
            vc.name = name
            vc.userScore = userScore
        }
    }

}
